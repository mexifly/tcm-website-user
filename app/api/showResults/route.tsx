import { query } from "@/lib/db";

// Define the Result type
type Respondent = {
    id: number;
    referenceNo: string;
    timeStamp: string;
    Constitution: string;
};

export async function GET(request: any): Promise<Response> {
    try {
        const queryResult: Respondent[] = await query({
            query: "SELECT * FROM respondents ORDER BY timestamp DESC LIMIT 1",
            values: [],
        }) as Respondent[];

        if (queryResult.length > 0) {
            const myResult = queryResult[0];
            return new Response(JSON.stringify(myResult), {
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

