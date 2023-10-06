"use client";

import React, { useState } from 'react';
import Image from 'next/image';

interface Question {
  id: number;
  textEn: string;
  textCn: string;
}

const questions: Question[] = [
  { id: 1, textEn: "Do you feel energetic?", textCn: "你精力充沛吗？" },
  // ... (include all other questions similarly)
];

export default function QuestionnairePage() {
  const [answers, setAnswers] = useState<{ [key: number]: string }>({});

  const handleRadioChange = (questionId: number, value: string) => {
    setAnswers((prev) => ({ ...prev, [questionId]: value }));
  };

  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div className="z-10 max-w-5xl w-full items-center justify-between font-mono text-sm lg:flex">
        <p className="mb-6 text-xl font-bold">Questionnaire</p>
        {questions.map((question) => (
          <div key={question.id} className="mb-4">
            <p>{question.textEn}</p>
            <p className="mb-2">{question.textCn}</p>
            {Array.from({ length: 5 }, (_, i) => i + 1).map((num) => (
              <label key={num} className="mr-3">
                <input
                  type="radio"
                  name={`q${question.id}`}
                  value={num}
                  checked={answers[question.id] === num.toString()}
                  onChange={() => handleRadioChange(question.id, num.toString())}
                />
                {num}
              </label>
            ))}
          </div>
        ))}
      </div>
      
      {/* Rest of your layout components (like the Image components and footer links) goes here ... */}

    </main>
  );
}

