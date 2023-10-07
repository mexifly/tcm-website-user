"use client";

import React from 'react';

export default function Home() {
  const handleNavigation = (event: React.MouseEvent<HTMLButtonElement>) => {
    event.preventDefault();

    const userAccepted = window.confirm("This is a test only");

    if (userAccepted) {
      window.location.href = 'test/';
    }
  };

  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24 bg-gray-200">
      <div className="absolute top-10 left-10">
        <h1 className="text-5xl font-bold text-blue-500">TCM</h1>
      </div>

      <div className="z-10 max-w-5xl w-full items-center justify-center font-mono text-lg text-center bg-white shadow-md rounded-md p-8">
        <p className="mb-4 text-2xl font-semibold text-gray-800">
          Welcome to the TCM Questionnaire
        </p>
        <button onClick={handleNavigation} className="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded">
          Go to Home Page
        </button>
        <p className="mt-8 max-w-xl mx-auto text-gray-700">
          Traditional Chinese Medicine (TCM) is a system of health care that dates back thousands of years. It encompasses various practices, such as acupuncture, herbal medicine, cupping, and diet therapy, all rooted in ancient Chinese philosophy and understanding of the body and its relationship with the environment. TCM aims to achieve harmony and balance within the body and has been utilized by millions of people across the world.
        </p>
      </div>
    </main>
  );
}

