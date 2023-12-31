"use client";
import React, { useEffect, useState } from 'react';
import './test.css';

// Define the Question type
type Question = {
  [x: string]: any;
  qid: number;
  groupId: number;
  id: number;
  textEn: string;
  textCn: string;
};

// define scales
const scaleOptions = ["No", "Seldom", "Sometimes", "Often", "Always"];

export default function QuestionnairePage() {
  // Define and retrieve the allQuestions data
  const [answers, setAnswers] = useState<{ [key: string]: string }>({});
  const [currentPart, setCurrentPart] = useState<number>(0);
  const [currentQuestionId, setCurrentQuestionId] = useState<number | null>(null);
  const [allQuestions, setAllQuestions] = useState([]); // Initialize with an empty array
  const [isLoading, setIsLoading] = useState(false);


  useEffect(() => {
    async function fetchQuestions() {
      try {
        const response = await fetch("/api/test/");
        if (response.ok) {
          const data = await response.json();
          console.log("API Request Successful");
          console.log("Received Data:", data); // Log the received data
          setAllQuestions(data);
        }
      } catch (error) {
        console.error("Error fetching questions:", error);
      }
    }

    fetchQuestions();
  }, []);

  const handleRadioChange = (qid: number, value: string) => {
    //const key = `${partIndex}-${questionId}`;
    setAnswers((prev) => ({ ...prev, [qid.toString()]: value }));
  };

  // const currentQuestions = allQuestions[currentPart];
  // Ensure that `currentQuestions` is only accessed when `allQuestions` is available
  const currentQuestions: Question = allQuestions[currentPart] || [];
  const isLastPart = currentPart === allQuestions.length - 1;
  const isAllQuestionsAnswered = Object.keys(answers).length === allQuestions.flat().length;

  const [hasSubmitted, setHasSubmitted] = useState(false); // 添加状态以跟踪是否已经提交

  const handleSubmit = async () => {
    if (!hasSubmitted && isAllQuestionsAnswered) { // 检查是否已经提交且所有问题都已回答
      try {
        setIsLoading(true); // Set loading to true when starting the request
        const response = await fetch("/api/test/save/", {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(answers),
        });

        if (response.ok) {
          alert("Thank you for submitting your answers!");
          setHasSubmitted(true); // 设置已提交状态为true
          window.location.href = '../showResults';
        } else {
          console.error('Server responded with status:', response.status, 'and status text:', response.statusText);
          throw new Error('Failed to save answers');
        }
      } catch (error) {
        console.error('Error saving answers:', error);
        alert("An error occurred while saving answers.");
      }
      finally {
        setIsLoading(false); // Set loading to false regardless of success or failure
      }
    } else {
      alert("Please answer all questions before submitting.");
    }
  };
  const [showDisclaimer, setShowDisclaimer] = useState(true);
  const [userAccepted, setUserAccepted] = useState(false);
  const [showInfoMessage, setShowInfoMessage] = useState(false);

  const handleAgree = () => {
    setUserAccepted(true);
    setShowDisclaimer(false);
  };

  const handleDisagree = () => {
    setUserAccepted(false);
    setShowDisclaimer(false);
    setShowInfoMessage(true);
  };

  const closeInfoMessage = () => {
    setShowInfoMessage(false);
    // navagate to '../home'page
    window.location.href = '../';
  };
  return (
    <main className="page-container flex min-h-screen flex-col items-center justify-center p-24 bg-gray-500">
      <div className="content-container z-10 max-w-2xl w-full items-center justify-center font-mono text-lg text-center shadow-md rounded-md p-8">
        <p className="mb-4 text-2xl font-semibold text-gray-800">TCM Scaled Questions</p>
        {/* TCM Scaled Questions content here */}

        <hr className="my-8 border-t border-gray-400" />

        <div className="mb-4">
          <p className="text-2xl font-semibold">Part {currentPart + 1}</p> {/* 添加部分标题 */}
        </div>

        {currentQuestions.map((question: Question) => {
          //const questionKey = `${currentPart}-${question.id}`;
          const isAnswered = question.qid.toString() in answers;
          return (
            <div
              key={question.qid}
              className={`mb-6 ${currentQuestionId === question.id ? 'bg-yellow-100' : ''} ${isAnswered ? 'bg-blue-100' : ''}`}
              onMouseEnter={() => setCurrentQuestionId(question.id)}
              onMouseLeave={() => setCurrentQuestionId(null)}
            >
              <p className="text-xl font-semibold">{question.textEn}</p>
              <p className="mb-2">{question.textCn}</p>
              <div className="flex justify-center items-center space-x-4">
                {scaleOptions.map((option, index) => (
                  <label key={option} className="flex items-center" style={{ cursor: 'pointer' }}>
                    <input
                      type="radio"
                      name={`q${question.qid}`}
                      value={index + 1}
                      checked={answers[question.qid.toString()] === (index + 1).toString()}
                      onChange={() => handleRadioChange(question.qid, (index + 1).toString())}
                    />
                    <span className="ml-2">{option}</span>
                  </label>
                ))}
              </div>
            </div>
          );
        })}

        <div className="flex justify-between mt-4">
          <button
            onClick={() => setCurrentPart((prev) => Math.max(prev - 1, 0))}
            className={`${currentPart === 0 ? 'invisible' : ''} btn btn-primary`}
          >
            Previous
          </button>
          {isLastPart ? (
            <button
              // one user can only submit once after answering all questions
              onClick={handleSubmit}
              className={`${isAllQuestionsAnswered && !hasSubmitted ? 'bg-green-500 hover:bg-green-600' : 'bg-gray-300 cursor-not-allowed'} text-white font-semibold py-2 px-4 rounded-md`}
              disabled={!isAllQuestionsAnswered || hasSubmitted}
            >
              {isLoading ? "Submitting...": hasSubmitted ? "Submitted" : "Submit"}
            </button>
          ) : (
            <button
              onClick={() => setCurrentPart((prev) => Math.min(prev + 1, allQuestions.length - 1))}
              className={`${currentPart === allQuestions.length - 1 ? 'invisible' : ''} btn btn-primary`}
            >
              Next
            </button>
          )}
        </div>
      </div>
      {showDisclaimer && (
        <div className="fixed top-0 left-0 w-full h-full flex items-center justify-center bg-black bg-opacity-50 z-50">
          <div className="bg-white p-8 rounded-md shadow-md">
            <h2 className="text-2xl font-semibold mb-4">Disclaimer</h2>
            <p className="text-gray-700">
              This website provides health advice only and is not qualified to provide medical diagnosis and treatment.
            </p>
            <div className="mt-4 flex justify-end">
              <button type="button" onClick={handleAgree} className="btn btn-success mx-2">Agree</button>
              <button type="button" onClick={handleDisagree} className="btn btn-secondary" data-bs-dismiss="modal">Disagree</button>
            </div>
          </div>
        </div>
      )}

      {showInfoMessage && (
        <div className="fixed top-0 left-0 w-full h-full flex items-center justify-center bg-black bg-opacity-50 z-50">
          <div className="bg-white p-8 rounded-md shadow-md">
            <h3>Notice</h3>
            <p className="text-warning-emphasis">You cannot use this website as you disagreed the disclaimer.</p>
            <div className="mt-4 flex justify-end">
              <button type="button" onClick={closeInfoMessage} className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      )}
    </main>
  );
}