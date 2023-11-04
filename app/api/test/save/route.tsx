import { query } from "@/lib/db";
import { OkPacket } from 'mysql2';


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

        // Here, compute the final result based on the answers and save in the respondents table. 
        // As a placeholder, I'm using 'COMPUTED_RESULT_HERE'. Replace it with your computation logic.
        const constitution = 'POWER!!!';
        await query({
            query: `UPDATE respondents SET constitution = ? WHERE id = ?`,
            values: [constitution, respondent_id],
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
