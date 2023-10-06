"use client";

import React from 'react';

export default function Home() {
  const handleNavigation = (event: React.MouseEvent<HTMLAnchorElement>) => {
    event.preventDefault();

    const userAccepted = window.confirm("This is a test only");
    
    if (userAccepted) {
      window.location.href = 'test/';
    }
  };

  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24">
      <div className="absolute top-10 left-10">
        <h1 className="text-5xl font-bold">TCM</h1>
      </div>

      <div className="z-10 max-w-5xl w-full items-center justify-center font-mono text-sm text-center">
        <p className="mb-4">
          Welcome to the TCM Questionnaire
        </p>
        <a href='test/' onClick={handleNavigation}> Go to Home Page</a>
        <p className="mt-8 max-w-xl mx-auto">
          Traditional Chinese Medicine (TCM) is a system of health care that dates back thousands of years. It encompasses various practices, such as acupuncture, herbal medicine, cupping, and diet therapy, all rooted in ancient Chinese philosophy and understanding of the body and its relationship with the environment. TCM aims to achieve harmony and balance within the body and has been utilized by millions of people across the world.
        </p>
      </div>
    </main>
  );
}
