import { query } from "@/lib/db";
import { OkPacket } from 'mysql2';
import axios from 'axios';

// Define the expected structure of the Cohere response
interface CohereResponse {
  text: string;
}

async function getCohereResponse(prompt: string): Promise<string> {
    try {
      const options = {
        method: 'POST',
        url: 'https://api.cohere.ai/v1/generate',
        headers: {
          accept: 'application/json',
          'content-type': 'application/json',
          authorization: process.env.MY_API_KEY // Ensure this is securely configured
        },
        data: {
          truncate: 'END',
          return_likelihoods: 'NONE',
          prompt: prompt
        }
      };
  
      const response = await axios.request<CohereResponse>(options);
  
      // Assuming the structure of the response is as you provided
      const recipeText = response.data.generations[0].text;
  
      return recipeText;
    } catch (error) {
      console.error(error);
      throw error;
    }
  }
  



function calculateTransformationScoreByGroup(responses: Responses[]): { [groupId: number]: number } {
    // Group responses by groupId
    const groupedResponses = responses.reduce((acc, response) => {
        const { groupId, answer } = response;
        if (!acc[groupId]) {
            acc[groupId] = [];
        }
        acc[groupId].push(answer);
        return acc;
    }, {} as { [groupId: number]: number[] });

    // Calculate transformation score for each group
    const transformationScoresByGroup: { [groupId: number]: number } = {};
    for (const groupId in groupedResponses) {
        const rawScores = groupedResponses[groupId];
        const rawScore = rawScores.reduce((acc, score) => acc + score, 0);
        const transformationScore = ((rawScore - rawScores.length) / (rawScores.length * 4)) * 100;
        transformationScoresByGroup[parseInt(groupId)] = transformationScore;
    }

    return transformationScoresByGroup;
}

function calculateConstitutionType(transformationScoresByGroup: { [groupId: number]: number }): string {
    const groupIds = Object.keys(transformationScoresByGroup);

    // Exclude the first group
    const remainingGroups = groupIds.slice(1);

    // Find the group with the maximum transformation score
    const maxTransformationScoreGroup = remainingGroups.reduce((maxGroup, groupId) => {
        return transformationScoresByGroup[groupId] > transformationScoresByGroup[maxGroup] ? groupId : maxGroup;
    }, remainingGroups[0]);

    const maxTransformationScore = transformationScoresByGroup[maxTransformationScoreGroup];

    if (maxTransformationScore < 30) {
        return "Neutral Constitution";
    } else {
        // Find the index of the maxTransformationScoreGroup in the remainingGroups
        const index = remainingGroups.indexOf(maxTransformationScoreGroup);

        if (index !== -1) {
            const constitutionTypes = [
                "Qi Deficient Constitution",
                "Yang Deficient Constitution",
                "Yin Deficient Constitution",
                "Phlegm-Dampness Constitution",
                "Damp-Heat Constitution",
                "Blood Stasis Constitution",
                "Qi-Stagnation Constitution",
                "Intrinsic Constitution",
            ];

            return constitutionTypes[index];
        } else {
            return "Unknown Constitution";
        }
    }
}

type Responses = {
    questionId: number;
    groupId: number;
    answer: number;
};

async function readStream(stream: ReadableStream): Promise<any> {
const reader = stream.getReader();
    const chunks: Uint8Array[] = [];
    let result;

    while (true) {
        const { done, value } = await reader.read();

        if (done) {
            break;
        }

        chunks.push(value);
    }

    const combined = new Uint8Array(chunks.reduce((acc, chunk) => acc + chunk.length, 0));
    let position = 0;
    for (const chunk of chunks) {
        combined.set(chunk, position);
        position += chunk.length;
    }

    const content = new TextDecoder().decode(combined);
    try {
        result = JSON.parse(content);
    } catch (error) {
        console.error("Failed to parse JSON", error);
        result = content;
    }

    return result;
}

export async function POST(request: any): Promise<Response> {
    const answers = await readStream(request.body);

    try {
        // Generate a unique reference number. Here's a simple method using current timestamp and a random number.
        const reference_number = `${Date.now()}-${Math.floor(Math.random() * 1000000)}`;

        // Insert into respondents table and get the respondent_id.
        const insertRespondentResult = await query({
            query: `INSERT INTO respondents (reference_number) VALUES (?)`,
            values: [reference_number],
        }) as OkPacket;
        const respondent_id = insertRespondentResult.insertId;

        const insertPromises = Object.keys(answers).map(async key => {
            const questionId = parseInt(key);
            const value = parseInt(answers[key]);
            console.log(`Inserting data for respondentId: ${respondent_id}, questionId: ${questionId}`);
            await query({
                query: `INSERT INTO responses (respondent_id, question_id, answer) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE answer = ?`,
                values: [respondent_id, questionId, value, value],
            });
            console.log(`Data inserted for respondentId: ${respondent_id}, questionId: ${questionId}`);
        });

        await Promise.all(insertPromises);
        console.log("successsfully inserts responses");
        // Here, compute the final result based on the answers and save in the respondents table. 
        // get all responses from the current respondent id
        const responsesResult: Responses[] = await query({
            query: `
            SELECT r.question_id, q.groupId, r.answer
            FROM responses r
            JOIN questions q ON r.question_id = q.qid
            WHERE r.respondent_id = ?
            ORDER BY r.question_id ASC;
            `,
            values: [respondent_id],
        }) as Responses[];

        console.log(responsesResult);
        const transformationScoresByGroup = calculateTransformationScoreByGroup(responsesResult);
        console.log("Transformation Score:", transformationScoresByGroup);
        const constitutionType = calculateConstitutionType(transformationScoresByGroup);
        console.log("Constitution Type:", constitutionType);

        await query({
            query: `UPDATE respondents SET constitution = ? WHERE id = ?`,
            values: [constitutionType, respondent_id],
        });

        const coherePrompt = `Provide recipe for ${constitutionType} patient under current season in TCM`;
        const recipe = await getCohereResponse(coherePrompt);
        console.log("recipe", recipe);
        await query({
            query: `UPDATE constitution_results SET recommendRecipe = ? WHERE consType = ?`,
            values: [recipe, constitutionType],
        });
        
        return new Response(JSON.stringify({ success: true, reference_number }), {
            status: 200,
            headers: {
                "Content-Type": "application/json",
            },
        });
    } catch (error) {
        const errorMessage = (error as Error).message;
        return new Response(JSON.stringify({ success: false, error: errorMessage }), {
            status: 500,
            headers: {
                "Content-Type": "application/json",
            },
        });
    }
}
