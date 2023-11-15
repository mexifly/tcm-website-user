import { query } from "@/lib/db";

// Define the Result type
type Respondent = {
    id: number;
    referenceNo: string;
    timeStamp: string;
    Constitution: string;
};

type constitution = {
    consId: number;
    consType: string;
    defination: string;
    disturbance: string;
    cause: string;
    vigilant: string;
    improvement: string;
    recommendRecipe: string;
}

export async function GET(request: Request): Promise<Response> {
    try {
        const respondentResult: Respondent[] = await query({
            query: "SELECT * FROM respondents ORDER BY timestamp DESC LIMIT 1",
            values: [],
        }) as Respondent[];

        console.log(respondentResult[0]);
        const constitutionType = respondentResult[0].constitution;

        console.log("consitution type is: " + constitutionType);

        const constitutionResult: constitution[] = await query({
            query: "SELECT * FROM constitution_results WHERE consType = ? ORDER BY consId DESC LIMIT 1;",
            values: [constitutionType],
        }) as constitution[];

        console.log("constitution result: " + constitutionResult)

        if (respondentResult.length > 0 && constitutionResult.length > 0) {
            const resResult = respondentResult[0];
            const constResult = constitutionResult[0];
            const resultData = {
                resResult,
                constResult
            };
            console.log(resultData);

            return new Response(JSON.stringify(resultData), {
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
        return new Response(JSON.stringify({ error: error.message }), {
            status: 500,
            headers: {
                "Content-Type": "application/json",
            },
        });
    }
}

