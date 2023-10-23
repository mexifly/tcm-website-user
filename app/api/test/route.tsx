import { query } from "@/lib/db";

// Define the User type
type Question = {
    id: number;
    questionEN: string;
    questionCN: string;
};

export async function GET(request: any): Promise<Response> {
    const questions: Question[] = await query({
        query: "SELECT * FROM test",
        values: [],
    }) as Question[];

    // Convert the user data into an HTML table
    let tableContent = questions.map((question: Question) => `
        <tr>
            <td>${question.id}</td>
            <td>${question.questionEN}</td>
            <td>${question.questionCN}</td>
        </tr>
    `).join('');

    let tableHTML = `
        <table style="border: 1px solid black;">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                ${tableContent}
            </tbody>
        </table>
    `;

    return new Response(tableHTML, {
        status: 200,
        headers: {
        "Content-Type": "text/html; charset=UTF-8"
        }
    });
}
