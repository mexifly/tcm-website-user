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
    const [respondentsData, setRespondentsData] = useState([]);

    useEffect(() => {
        // Fetch the respondent data from the server when the component mounts
        async function fetchRespondentsData() {
            try {
                const response = await fetch("/api/showResults");
                if (response.ok) {
                    const data = await response.json();
                    setRespondentsData(data);
                    console.log("successfully fetch the data!")
                } else {
                    console.error('Failed to fetch respondents data:', response.status, response.statusText);
                }
            } catch (error) {
                console.error('Error fetching respondents data:', error);
            }
        }

        fetchRespondentsData();
    }, []);

    return (
        <main className="page-container flex min-h-screen flex-col items-center justify-center p-24 bg-gray-200">
            <div className="content-container z-10 max-w-5xl w-full items-center justify-left font-mono text-lg text-center shadow-md rounded-md p-8">
                <p className="mb-4 text-2xl font-semibold text-green-800">
                Your Result
                </p>
                    <ul>
                        <li className="respondent-info">
                            <p><strong>Customer ID:</strong> {respondentsData.id || 'N/A'}</p>
                            <p><strong>Reference Number:</strong> {respondentsData.reference_number || 'N/A'}</p>
                            <p><strong>Timestamp:</strong> {respondentsData.timestamp || 'N/A'}</p>
                            <p><strong>Constitution:</strong> {respondentsData.constitution || 'N/A'}</p>
                        </li>
                    </ul>        
            </div>
        </main>
    );
};

export default ResultsPage;
