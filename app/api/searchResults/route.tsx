import { query } from "@/lib/db";
import { NextRequest } from "next/server";

type Respondent = {
    id: number;
    referenceNo: string;
    timeStamp: string;
    Constitution: string;
};

type Responses = {
    questionId: number;
    textEn: string;
    textCn: string;
    answer: number;
    meaning: string;
};

type constitution = {
    consId: number;
    consType: string;
    defination: string;
    disturbance: string;
    cause: string;
    vigilant: string;
    improvement: string;
    recommondReceipe: string;
}

export async function GET(request: Request) {
    try {
        // get referenceNumber from request
        console.log("enter search result route")
        const { searchParams } = new URL(request.url);
        const referenceNumber = searchParams.get('referenceNumber');
        const respondentResult: Respondent[] = await query({
            query: "SELECT * FROM respondents WHERE reference_number = ? ORDER BY timestamp DESC LIMIT 1",
            values: [referenceNumber],
        }) as Respondent[];

        const respondentId = respondentResult[0].id;
        const responsesResult: Responses[] = await query({
            query: `
            SELECT r.question_id, q.textEn, q.textCn, r.answer, am.meaning
            FROM responses r
            JOIN questions q ON r.question_id = q.qid
            JOIN answermap am ON r.answer = am.scale
            WHERE r.respondent_id = ?
            ORDER BY r.question_id ASC
            `,
            values: [respondentId],
        }) as Responses[];
        
        const constitutionType = respondentResult[0].constitution;

        console.log("consitution type is: " + constitutionType);

        const constitutionResult: constitution[] = await query({
            query: "SELECT * FROM constitution_results WHERE consType = ? ORDER BY consId DESC LIMIT 1;",
            values: [constitutionType],
        }) as constitution[];

        if (respondentResult.length > 0 && responsesResult.length > 0) {
            const myResult = respondentResult[0];
            const constResult = constitutionResult[0];
            const responseData = {
                myResult,
                constResult,
                responsesResult,
            };
            console.log(responseData)
            return new Response(JSON.stringify(responseData), {
                status: 200,
                headers: {
                    "Content-Type": "application/json",
                },
            });
        } else {
            return new Response(JSON.stringify({ message: "No data found" }), {
                status: 404,
                headers: {
                    "Content-Type": "application/json",
                },
            });
        }
        
    } catch (error: any) { // Specify the type of error as 'any'
        console.log(`reqeust error: ${error}`)
        return new Response(JSON.stringify({ error: error.message }), {
            status: 500,
            headers: {
                "Content-Type": "application/json",
            },
        });
    }
}

