import { query } from "@/lib/db";

// Define the Question type
type Question = {
    groupId: number;
    id: number;
    textEn: string;
    textCn: string;
};

export async function GET(request: any): Promise<Response> {
    const questions: Question[] = await query({
        query: "SELECT * FROM questions",
        values: [],
    }) as Question[];

    // Group the questions by groupId into a two-dimensional array
    const allQuestions: Question[][] = [];
    let currentGroup: Question[] = [];
    let currentGroupId: number | null = null;

    questions.forEach((question: Question) => {
        if (currentGroupId !== null && currentGroupId !== question.groupId) {
            allQuestions.push([...currentGroup]);
            currentGroup = [];
        }
        currentGroup.push(question);
        currentGroupId = question.groupId;
    });

    if (currentGroup.length > 0) {
        allQuestions.push([...currentGroup]);
    }

    return new Response(JSON.stringify(allQuestions), {
        status: 200,
        headers: {
            "Content-Type": "application/json",
        },
    });
}

