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
  { id: 2, textEn: "Do you feel tired easily?", textCn: "您容易疲乏吗？" },
  { id: 3, textEn: "Comparing to people around you, do you always feel colder and need to wear more clothes to keep warm?", textCn: "您比一般人耐受不了寒冷吗？" },
  { id: 4, textEn: "Are you able to adapt to changes in the environment and society?", textCn: "您能适应外界自然和社会环境的变化吗？" },
  { id: 5, textEn: "Does your voice sound too soft? For example, you often need to raise your voice for people to hear you.", textCn: "您说话声音低弱无力吗?" },
  { id: 6, textEn: "Do you always feel something is bothering you making you unhappy?", textCn: "您感到闷闷不乐、情绪低沉吗?" },
  { id: 7, textEn: "Do you have difficulties remembering things?", textCn: "您容易忘事（健忘）吗？" },
  { id: 8, textEn: "Do you have difficulties falling asleep at night?", textCn: "您容易失眠吗？" },
  // ... (include all other questions similarly)
];

export default function QuestionnairePage() {
  const [answers, setAnswers] = useState<{ [key: number]: string }>({});

  const handleRadioChange = (questionId: number, value: string) => {
    setAnswers((prev) => ({ ...prev, [questionId]: value }));
  };

  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24 bg-gray-200">
      <div className="z-10 max-w-5xl w-full items-center justify-center font-mono text-lg text-center bg-white shadow-md rounded-md p-8">
        <p className="mb-4 text-2xl font-semibold text-gray-800">TCM Scaled Questions</p>

        {/* TCM Scaled Questions content here */}

        <hr className="my-8 border-t border-gray-400" />

        {questions.map((question) => (
          <div key={question.id} className="mb-6">
            <p className="text-xl font-semibold">{question.textEn}</p>
            <p className="mb-2">{question.textCn}</p>
            <div className="flex justify-center items-center space-x-4">
              {Array.from({ length: 5 }, (_, i) => i + 1).map((num) => (
                <label key={num} className="flex items-center">
                  <input
                    type="radio"
                    name={`q${question.id}`}
                    value={num}
                    checked={answers[question.id] === num.toString()}
                    onChange={() => handleRadioChange(question.id, num.toString())}
                  />
                  <span className="ml-2">{num}</span>
                </label>
              ))}
            </div>
          </div>
        ))}
      </div>

      {/* Rest of your layout components (like the Image components and footer links) goes here ... */}

    </main>
  );
}

