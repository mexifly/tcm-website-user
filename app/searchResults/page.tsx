"use client";
// import React, { useState, useEffect } from 'react';


// type Respondent = {
//     id: number;
//     referenceNo: string;
//     timeStamp: string;
//     Constitution: string;
// };


// const SearchPage = () => {
//     const [referenceNumber, setReferenceNumber] = useState('');
//     // const [searchResult, setSearchResult] = useState<Respondent | null>(null);
//     const [searchResult, setSearchResult] = useState<Respondent[]>([]);
//     useEffect(() => {
//         // Fetch the respondent data from the server when the component mounts
//         async function fetchSearchData() {
//             try {
//                 console.log(referenceNumber)
//                 const response = await fetch(`/api/searchResults?referenceNumber=${referenceNumber}`);
//                 if (response.ok) {
//                     const data: Respondent[] = await response.json();
//                     setSearchResult(data);
//                     console.log('successfully fetch the data');
//                 } else {
//                     // Handle error
//                     console.log('unsuccessfully fetch the data');
//                 }
//             } catch (error) {
//                 console.error('Error fetching respondents data:', error);
//             }
//         }
//         fetchSearchData();
//     }, []);
    
//     return (
//         <div>
//             <h2>Search Page</h2>
//             <input
//                 type="text"
//                 placeholder="Enter Reference Number"
//                 value={referenceNumber}
//                 onChange={(e) => setReferenceNumber(e.target.value)}
//             />

//             <button onClick={SearchPage}>Submit</button> {/* Add a Submit button */}

//             {searchResult && (
//                 <div>
//                     <h3>Search Result:</h3>
//                     <p>ID: {searchResult.id}</p>
//                     <p>Reference Number: {searchResult.referenceNo}</p>
//                     <p>Timestamp: {searchResult.timeStamp}</p>
//                     <p>Constitution: {searchResult.Constitution}</p>
//                 </div>
//             )}
//         </div>
//     );
// }

// export default SearchPage;


// const SearchPage: React.FC = () => {
//     const [referenceNumber, setReferenceNumber] = useState('');
//     const [searchResult, setSearchResult] = useState<Respondent | null>(null);

//     const searchData = async () => {
//         if (referenceNumber) {
//             try {
//                 console.log(referenceNumber)
//                 const response = await fetch(`/api/searchResults?request=${referenceNumber}`);
//                 if (response.ok) {
//                     const data: Respondent = await response.json();
//                     setSearchResult(data);
//                     console.log('successfully fetch the data');
//                 } else {
//                     // Handle error
//                     console.log('unsuccessfully fetch the data');
//                 }
//             } catch (error) {
//                 // Handle error
//             }
//         }
//     };

//     return (
//         <div>
//             <h2>Search Page</h2>
//             <input
//                 type="text"
//                 placeholder="Enter Reference Number"
//                 value={referenceNumber}
//                 onChange={(e) => setReferenceNumber(e.target.value)}
//             />

//             <button onClick={searchData}>Submit</button> {/* Add a Submit button */}

//             {searchResult && (
//                 <div>
//                     <h3>Search Result:</h3>
//                     <p>ID: {searchResult.id}</p>
//                     <p>Reference Number: {searchResult.referenceNo}</p>
//                     <p>Timestamp: {searchResult.timeStamp}</p>
//                     <p>Constitution: {searchResult.Constitution}</p>
//                 </div>
//             )}
//         </div>
//     );
// };

// export default SearchPage;


// import React, { useState, useEffect } from 'react';

// type Respondent = {
//     id: number;
//     referenceNo: string;
//     timeStamp: string;
//     Constitution: string;
// };

// const SearchPage = () => {
//     const [referenceNumber, setReferenceNumber] = useState('');
//     const [searchResult, setSearchResult] = useState<Respondent[]>([]);

//     const fetchData = async () => {
//         try {
//             const response = await fetch(`/api/searchResults?referenceNumber=${referenceNumber}`);
//             if (response.ok) {
//                 const data: Respondent[] = await response.json();
//                 setSearchResult(data);
//                 console.log('Successfully fetched the data');
//             } else {
//                 console.error('Failed to fetch data:', response.status, response.statusText);
//             }
//         } catch (error) {
//             console.error('Error fetching data:', error);
//         }
//     };

//     const handleSearch = () => {
//         if (referenceNumber) {
//             fetchData();
//         }
//     };

//     return (
//         <div>
//             <h2>Search Page</h2>
//             <input
//                 type="text"
//                 placeholder="Enter Reference Number"
//                 value={referenceNumber}
//                 onChange={(e) => setReferenceNumber(e.target.value)}
//             />

//             <button onClick={handleSearch}>Submit</button>

//             {searchResult && (
//                 <div>
//                     <h3>Search Result:</h3>
//                     <p>ID: {searchResult.id}</p>
//                     <p>Reference Number: {searchResult.referenceNo}</p>
//                     <p>Timestamp: {searchResult.timeStamp}</p>
//                     <p>Constitution: {searchResult.Constitution}</p>
//                 </div>
//             )}
//         </div>
//     );
// }

// export default SearchPage;
import React, { useState, useEffect } from 'react';

type Respondent = {
    id: number;
    referenceNo: string;
    timeStamp: string;
    Constitution: string;
};

const SearchPage = () => {
    const [referenceNumber, setReferenceNumber] = useState('');
    const [searchResult, setSearchResult] = useState<Respondent[]>([]);

    const fetchSearchData = async () => {
        try {
            console.log(referenceNumber);
            const response = await fetch(`/api/searchResults?referenceNumber=${referenceNumber}`);
            console.log(response)
            if (response.ok) {
                const data: Respondent[] = await response.json();
                setSearchResult(data);
                console.log('Successfully fetched the data');
            } else {
                console.error('Failed to fetch data:', response.status, response.statusText);
            }
        } catch (error) {
            console.error('Error fetching respondents data:', error);
        }
    }

    const handleSearch = () => {
        if (referenceNumber) {
            fetchSearchData();
        }
    };

    return (
        <div>
            <h2>Search Page</h2>
            <input
                type="text"
                placeholder="Enter Reference Number"
                value={referenceNumber}
                onChange={(e) => setReferenceNumber(e.target.value)}
            />

            <button onClick={handleSearch}>Submit</button>

            {searchResult && searchResult.length > 0 && (
                <div>
                    <h3>Search Result:</h3>
                    {searchResult.map((result, index) => (
                        <div key={index}>
                            <p>ID: {result.id}</p>
                            <p>Reference Number: {result.referenceNo}</p>
                            <p>Timestamp: {result.timeStamp}</p>
                            <p>Constitution: {result.Constitution}</p>
                        </div>
                    ))}
                </div>
            )}
        </div>
    );
}

export default SearchPage;
