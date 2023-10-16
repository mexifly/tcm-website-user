"use client";

import React, { useState } from 'react';

export default function Home() {
  const [showDisclaimer, setShowDisclaimer] = useState(false);
  const [userAccepted, setUserAccepted] = useState(false);
  const [showInfoMessage, setShowInfoMessage] = useState(false);

  const handleNavigation = (event: React.MouseEvent<HTMLButtonElement>) => {
    event.preventDefault();
    setShowDisclaimer(true);
  };

  const handleAgree = () => {
    setUserAccepted(true);
    setShowDisclaimer(false);
    // navagate to '/test'page
    window.location.href = '/test';
  };

  const handleDisagree = () => {
    setUserAccepted(false);
    setShowDisclaimer(false);
    setShowInfoMessage(true);
  };

  const closeInfoMessage = () => {
    setShowInfoMessage(false);
  };

  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24 bg-gray-200">
      <div className="z-10 max-w-5xl w-full items-center justify-center font-mono text-lg text-center bg-white shadow-md rounded-md p-8">
        <p className="mb-4 text-2xl font-semibold text-gray-800">
          Welcome to TCM Health Website
        </p>
        <button onClick={handleNavigation} className="btn btn-primary">Go to Home Page</button>
        <p className="mt-8 max-w-xl mx-auto text-gray-700">
          Traditional Chinese Medicine (TCM) is a system of health care that dates back thousands of years. It encompasses various practices, such as acupuncture, herbal medicine, cupping, and diet therapy, all rooted in ancient Chinese philosophy and understanding of the body and its relationship with the environment. TCM aims to achieve harmony and balance within the body and has been utilized by millions of people across the world.
        </p>
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

