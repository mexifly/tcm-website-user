"use client";
import React, { useState } from 'react';
import '../test/test.css';

const SearchPage = () => {
    const [respondentsData, setRespondentsData] = useState([]);
    const [referenceNumber, setReferenceNumber] = useState('');
    const [dataNotFound, setDataNotFound] = useState(false);
    const [isDataFetched, setIsDataFetched] = useState(false); // Add state to track if data is fetched

    const fetchData = async () => {
        try {
            const url = `/api/searchResults?referenceNumber=${referenceNumber}`;
            const response = await fetch(url);

            if (response.ok) {
                const data = await response.json();
                setRespondentsData(data);
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
                        style={{ marginRight: '10px', width: '300px'}}
                        placeholder="Enter Reference No"
                        value={referenceNumber}
                        onChange={(e) => setReferenceNumber(e.target.value)}
                    />
                    <button type="submit" onClick={fetchData}  className="btn btn-primary">Submit</button>
                </div>
                {dataNotFound && <p>Data not found</p>}
                {isDataFetched && (
                    <ul>
                        <li className="respondent-info">
                            <p><strong>Customer ID:</strong> {respondentsData.id}</p>
                            <p><strong>Reference Number:</strong> {respondentsData.reference_number}</p>
                            <p><strong>Timestamp:</strong> {respondentsData.timestamp}</p>
                            <p><strong>Constitution:</strong> {respondentsData.constitution}</p>
                        </li>
                    </ul>
                )}
            </div>
        </main>
    );
};

export default SearchPage;

