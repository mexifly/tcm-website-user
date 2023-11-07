import { query } from "@/lib/db";
import { VercelRequest, VercelResponse } from '@vercel/node';

type Respondent = {
    id: number;
    referenceNo: string;
    timeStamp: string;
    Constitution: string;
};

export async function GET(request: VercelRequest, response: VercelResponse) {
    try {
        const referenceNumber = request.query.referenceNumber as string;
        console.log(referenceNumber)
        const queryResult: Respondent[] = await query({
            query: "SELECT * FROM respondents WHERE reference_number = ? ORDER BY timestamp DESC LIMIT 1",
            values: [referenceNumber],
        }) as Respondent[];

        if (queryResult.length > 0) {
            const myResult = queryResult[0];
            response.status(200).json(myResult);
        } else {
            response.status(404).json({ message: "No data found" });
        }
    } catch (error: any) {
        response.status(500).json({ error: error.message });
    }
}
