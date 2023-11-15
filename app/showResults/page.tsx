"use client";
import React, { useEffect, useState } from 'react';
import '../test/test.css';

// // Define the Result type
// type Respondent = {
//     id: number;
//     referenceNo: string;
//     timeStamp: string;
//     Constitution: string;
// };

const ResultsPage = () => {
    const [respondentResult, setRespondentsData] = useState([]);
    const [constitutionResult, setconstitutionResult] = useState([]);

    useEffect(() => {
        // Fetch the respondent data from the server when the component mounts
        async function fetchResultData() {
            try {
                const response = await fetch("/api/showResults");
                if (response.ok) {
                    const { resResult, constResult } = await response.json();
                    setRespondentsData(resResult);
                    setconstitutionResult(constResult);
                    console.log("successfully fetch the data!")
                } else {
                    console.error('Failed to fetch respondents data:', response.status, response.statusText);
                }
            } catch (error) {
                console.error('Error fetching respondents data:', error);
            }
        }

        fetchResultData();
    }, []);

    return (
        <main className="page-container flex min-h-screen flex-col items-center justify-center p-24 bg-gray-200">
            <div className="content-container z-10 max-w-5xl w-full items-center justify-left font-mono text-lg text-center shadow-md rounded-md p-8">
                <p className="mb-4 text-2xl font-semibold text-green-800">
                Your Result
                </p>
                    <ul>
                        <li className="respondent-info">
                        <p><strong>Customer ID:</strong> {respondentResult.id || 'N/A'}</p>
                        <p><strong>Reference Number:</strong> {respondentResult.reference_number || 'N/A'}</p>
                        <p><strong>Timestamp:</strong> {respondentResult.timestamp || 'N/A'}</p>
                        <p><strong>Constitution:</strong> {respondentResult.constitution || 'N/A'}</p>
                        </li>
                    </ul>
                    <ul>
                        <li className="Constitution-info">
                        <p><strong>Constitution ID:</strong> {constitutionResult.consId || 'N/A'}</p>
                        <p><strong>Constitution Type:</strong> {constitutionResult.consType || 'N/A'}</p>
                        <p><strong>Definition:</strong> {constitutionResult.definition || 'N/A'}</p>
                        <p><strong>Disturbance:</strong> {constitutionResult.disturbance || 'N/A'}</p>
                        <p><strong>Cause:</strong> {constitutionResult.cause || 'N/A'}</p>
                        <p><strong>Vigilant:</strong> {constitutionResult.vigilant || 'N/A'}</p>
                        <p><strong>Improvement:</strong> {constitutionResult.improvement || 'N/A'}</p>
                        <div>
                            <strong>RecommendRecipe:</strong>
                            {(constitutionResult.recommendRecipe || 'N/A').split('\n').map((line, index) => (
                                <React.Fragment key={index}>
                                {line}<br/>
                                </React.Fragment>
                            ))}
                        </div>
                        </li>
                    </ul>        
            </div>
        </main>
    );
};

export default ResultsPage;
