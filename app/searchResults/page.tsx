"use client";
import React, { useState } from 'react';
import '../test/test.css';

const isValidInput = (input: string) => {
    // 正则表达式，表示只能包含数字和'-'
    const regex = /^[0-9-]{18,25}$/;
    return regex.test(input);
};
 
const SearchPage = () => {
    const [respondentsData, setRespondentsData] = useState([]);
    const [responsesResult, setresponsesResult] = useState([]);
    const [constitutionResult, setconstitutionResult] = useState([]);
    const [referenceNumber, setReferenceNumber] = useState('');
    const [dataNotFound, setDataNotFound] = useState(false);
    const [isDataFetched, setIsDataFetched] = useState(false); // Add state to track if data is fetched
    const [error, setError] = useState(''); // 新增用于存储错误消息的状态
    const fetchData = async () => {
        try {
            if (!isValidInput(referenceNumber)) {
                setError('Invalid input. Please enter 20-25 digits and/or hyphens.');
                return;
            }
            // empty error message
            setError('');

            const url = `/api/searchResults?referenceNumber=${referenceNumber}`;
            const response = await fetch(url);

            if (response.ok) {
                const { myResult,  constResult, responsesResult} = await response.json();
                console.log(myResult);
                console.log(responsesResult);
                setRespondentsData(myResult);
                setresponsesResult(responsesResult);
                setconstitutionResult(constResult);
                setDataNotFound(false);
                setIsDataFetched(true); // Set data as fetched
            } else {
                console.log('Failed to fetch respondents data:', response.status, response.statusText);
                setDataNotFound(true);
            }
        } catch (error) {
            console.error('Error fetching respondents data:', error);
        }
    };

    return (
        <main className="page-container flex min-h-screen flex-col items-center justify-center p-24 bg-gray-200">
            <div className="content-container z-10 max-w-5xl w-full items-center justify-left font-mono text-lg text-center shadow-md rounded-md p-8">
                <p className="mb-4 text-2xl font-semibold text-green-800">
                    Search Your Result
                </p>
                <div style={{ display: 'flex', justifyContent: 'center' }}>
                    <input
                        type="text"
                        className="form-control"
                        style={{ marginRight: '10px', marginBottom:'10px', width: '300px' }}
                        placeholder="Enter Reference No"
                        value={referenceNumber}
                        onChange={(e) => setReferenceNumber(e.target.value)}
                    />
                    <button type="submit" onClick={fetchData} className="btn btn-primary">
                        Submit
                    </button>
                </div>
                {error && <p className="text-red-500">{error}</p>} {/* show input error */}
                {dataNotFound && <p className="text-red-500">Data not found</p>}
                {isDataFetched && (
                    <div>
                        <div>
                            <p><strong>Reference Number: </strong>{respondentsData.reference_number}</p>
                            <p><strong>Timestamp: </strong>{respondentsData.timestamp}</p>
                        </div>
                        <div>
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
                        </div>
                        <div>
                            <table style={{ margin: 'auto' }}>
                                <thead>
                                    <tr>
                                        <th>Question ID</th>
                                        <th>textEn</th>
                                        <th>textCn</th>
                                        <th>Answer</th>
                                        <th>Meaning</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {responsesResult.map((response, index) => (
                                        <tr key={index}>
                                            <td>{response.question_id}</td>
                                            <td>{response.textEn}</td>
                                            <td>{response.textCn}</td>
                                            <td>{response.answer}</td>
                                            <td>{response.meaning}</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </div>
                )}
            </div>
        </main>
    );
};

export default SearchPage;

