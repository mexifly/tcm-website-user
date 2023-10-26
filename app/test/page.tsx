"use client";
import React, { useEffect, useState } from 'react';
import './test.css';

// Define the Question type
type Question = {
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

  const handleRadioChange = (partIndex: number, questionId: number, value: string) => {
    const key = `${partIndex}-${questionId}`;
    setAnswers((prev) => ({ ...prev, [key]: value }));
  };

  // const currentQuestions = allQuestions[currentPart];
  // Ensure that `currentQuestions` is only accessed when `allQuestions` is available
  const currentQuestions : Question = allQuestions[currentPart] || [];
  const isLastPart = currentPart === allQuestions.length - 1;
  const isAllQuestionsAnswered = Object.keys(answers).length === allQuestions.flat().length;

  const handleSubmit = () => {
    if (isAllQuestionsAnswered) {
      // 所有问题都已答完，可以执行提交操作
      // 在这里执行提交逻辑，可以将答案发送到后端或执行其他操作
      // 此处仅示例一个简单的弹出提示
      alert("Thank you for submitting your answers!");
    } else {
      // 还有未回答的问题
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

        {currentQuestions.map((question : Question) => {
          const questionKey = `${currentPart}-${question.id}`;
          const isAnswered = questionKey in answers;
          return (
            <div
              key={question.id}
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
                      name={`q${question.id}`}
                      value={index + 1}
                      checked={answers[questionKey] === (index + 1).toString()}
                      onChange={() => handleRadioChange(currentPart, question.id, (index + 1).toString())}
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
              onClick={handleSubmit} // 点击提交按钮时触发 handleSubmit 函数
              className={`${isAllQuestionsAnswered ? 'bg-green-500 hover:bg-green-600' : 'bg-gray-300 cursor-not-allowed'} text-white font-semibold py-2 px-4 rounded-md`}
              disabled={!isAllQuestionsAnswered}
            >
              Submit
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
      {/* Rest of your layout components (like the Image components and footer links) goes here ... */}
    </main>
  );
}