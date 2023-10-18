"use client";

import React, { useState } from 'react';
import './home.css';

export default function Home() {

  const handleNavigation = (event: React.MouseEvent<HTMLButtonElement>) => {
    event.preventDefault();
    window.location.href = './test';
  };

  return (
    <main className="page-container flex min-h-screen flex-col items-center justify-center p-24 bg-gray-200">
      <div className="content-container z-10 max-w-5xl w-full items-center justify-left font-mono text-lg text-center shadow-md rounded-md p-8">
        <p className="mb-4 text-2xl font-semibold text-green-800">
          Welcome to TCM Health Website
        </p>
        <button onClick={handleNavigation} className="btn btn-primary">Go to Test Page</button>
        <p className="font-semibold mt-8 max-w-xl mx-auto text-gray-700">
          Traditional Chinese Medicine (TCM) is a system of health care that dates back thousands of years. It encompasses various practices, such as acupuncture, herbal medicine, cupping, and diet therapy, all rooted in ancient Chinese philosophy and understanding of the body and its relationship with the environment. TCM aims to achieve harmony and balance within the body and has been utilized by millions of people across the world.
        </p>
      </div>
    </main>
  );
}

