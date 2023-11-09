import { query } from "@/lib/db";
import { NextRequest } from "next/server";

type Respondent = {
    id: number;
    referenceNo: string;
    timeStamp: string;
    Constitution: string;
};

export async function GET(request: Request) {
    try {
        // get referenceNumber from request
        const { searchParams } = new URL(request.url);
        const referenceNumber = searchParams.get('referenceNumber');
        console.log(referenceNumber);
        const queryResult: Respondent[] = await query({
            query: "SELECT * FROM respondents WHERE reference_number = ? ORDER BY timestamp DESC LIMIT 1",
            values: [referenceNumber],
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
        console.log(`reqeust error: ${error}`)
        return new Response(JSON.stringify({ error: error.message }), {
            status: 500,
            headers: {
                "Content-Type": "application/json",
            },
        });
    }
}

