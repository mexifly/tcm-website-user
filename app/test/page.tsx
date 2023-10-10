"use client";
import React, { useState } from 'react';

interface Question {
  id: number;
  textEn: string;
  textCn: string;
}
const allQuestions: Question[][] = [
  [
    // Part 1 / 9
    { id: 1, textEn: "Do you feel energetic?", textCn: "你精力充沛吗？" },
    { id: 2, textEn: "Do you feel tired easily?", textCn: "您容易疲乏吗？" },
    { id: 3, textEn: "Comparing to people around you, do you always feel colder and need to wear more clothes to keep warm?", textCn: "您比一般人耐受不了寒冷吗？" },
    { id: 4, textEn: "Are you able to adapt to changes in the environment and society?", textCn: "您能适应外界自然和社会环境的变化吗？" },
    { id: 5, textEn: "Does your voice sound too soft? For example, you often need to raise your voice for people to hear you.", textCn: "您说话声音低弱无力吗?" },
    { id: 6, textEn: "Do you always feel something is bothering you making you unhappy?", textCn: "您感到闷闷不乐、情绪低沉吗?" },
    { id: 7, textEn: "Do you have difficulties remembering things?", textCn: "您容易忘事（健忘）吗？" },
    { id: 8, textEn: "Do you have difficulties falling asleep at night?", textCn: "您容易失眠吗？" },
  ],
  [
    // Part 2 / 9
    { id: 1, textEn: "Do you feel tired easily?", textCn: "您容易疲乏吗？" },
    { id: 2, textEn: "Do you feel shortness of breath easily?", textCn: "您容易气短(呼吸短促，接不上气)吗？" },
    { id: 3, textEn: "Does your voice sound too soft? ", textCn: "您说话声音低弱无力吗?" },
    { id: 4, textEn: "Do you experience fast heartbeat easily?", textCn: "您容易心慌吗？" },
    { id: 5, textEn: "Do you prefer quiet and don't like to talk?", textCn: "您喜欢安静、懒得说话吗?" },
    { id: 6, textEn: "Do you feel giddiness (or when you stand up) easily?", textCn: "您容易头晕或站起时晕眩吗？" },
    { id: 7, textEn: "Comparing to people around you, do you catch a cold easily?", textCn: "您比别人容易患感冒吗?" },
    { id: 8, textEn: "Do you find yourself sweat easily when you have a bit more physical activity?", textCn: "您活动量稍大就容易出虚汗吗?" },
  ],
  [
    // Part 3 / 9
    { id: 1, textEn: "Does your palm and feet feel cold/ cool most of the time?", textCn: "您手脚发凉吗?" },
    { id: 2, textEn: "Does your stomach, back, waist or knee area feel cold?", textCn: "您胃脘部、背部或腰膝部怕冷吗？" },
    { id: 3, textEn: "Do you feel cold and often wear more clothes than most people?", textCn: "您感到怕冷、衣服比别人穿的多吗?" },
    { id: 4, textEn: "Comparing to people around you, do you always feel colder and need to wear more clothes to keep warm?", textCn: "您比一般人耐受不了寒冷吗？" },
    { id: 5, textEn: "Comparing to people around you, do you catch a flu easily?", textCn: "您比别人容易患感冒吗?" },
    { id: 6, textEn: "Do you feel uncomfortable after taking cold drinks? Or are you afraid of taking cold food / drinks?", textCn: "您吃(喝)凉的东西会感到不舒服或者怕吃(喝)凉的东西吗？" },
    { id: 7, textEn: "Do you have diarrhea when you eat cold stuff or caught a cold?", textCn: "您受凉或吃(喝)凉的东西后，容易拉肚子吗?" },
  ],
  [
    // Part 4 / 9
    { id: 1, textEn: "Do you feel your palm and feet hot?", textCn: "您感到手脚心发热吗?" },
    { id: 2, textEn: "Does your body or face feel hot?", textCn: "您感觉身体、脸上发热吗?" },
    { id: 3, textEn: "Does both sides of your face show redness?", textCn: "您面部两颧潮红或偏红吗? " },
    { id: 4, textEn: "Does your lips look redder than most people?", textCn: "您口唇的颜色比一般人红吗?" },
    { id: 5, textEn: "Do you have dry lips / skin?", textCn: "您皮肤或口唇干吗?" },
    { id: 6, textEn: "Do you have constipation easily or your stools are hard and dry?", textCn: "您容易便秘或大便干燥吗?" },
    { id: 7, textEn: "Do you feel dryness in your eyes?", textCn: "您感到眼睛干涩吗？" },
    { id: 8, textEn: "Do you feel thirsty and always want to drink water?", textCn: "您感到口干咽燥、总想喝水吗？" },
  ],
  [
    // Part 5 / 9
    { id: 1, textEn: "Is your forehead oily?", textCn: "您有额部油脂分泌多的现象吗? " },
    { id: 2, textEn: "Do you feel fullness in your chest and stomach?", textCn: "您感到胸闷或腹部胀满吗？" },
    { id: 3, textEn: "Is your belly area fat and soft?", textCn: "您腹部肥满松软吗?" },
    { id: 4, textEn: "Do you feel heaviness in your body?", textCn: "您感到身体沉重不轻松或不爽快吗?" },
    { id: 5, textEn: "Do you find your upper eye lid more swollen compared to most people?", textCn: "您上眼睑比别人肿吗？" },
    { id: 6, textEn: "Do you feel stickiness inside your mouth?", textCn: "您舌苔厚腻或有舌苔厚厚的感觉吗? " },
    { id: 7, textEn: "Do you feel your tongue coating thick?", textCn: "您感到眼睛干涩吗？" },
    { id: 8, textEn: "Do you normally have phlegm? Especially in your throat area?", textCn: "您平时痰多，特别是咽喉部总感到有痰堵着吗?" },
  ],
  [
    // Part 6 / 9
    { id: 1, textEn: "Do you have oily skin on your face and nose area?", textCn: "您面部或鼻部有油腻感或者油亮发光吗? " },
    { id: 2, textEn: "Do you have pimples / breakout easily?", textCn: "您易生痤疮或者疮疖吗?" },
    { id: 3, textEn: "Do you feel bitterness or a strange taste in your mouth?", textCn: "您感到口苦或嘴里有异味吗?" },
    { id: 4, textEn: "Do you have sticky stools or always feel you don't have a complete defecate?", textCn: "您大便黏滞不爽、有解不尽的感觉吗?" },
    { id: 5, textEn: "Do you feel your urethra has a hot sensation when you urine? Or your urine is dark in color?", textCn: "您小便时尿道有发热感、尿色浓(深)吗？" },
    { id: 6, textEn: "Does your discharge yellow or brown in color?", textCn: "您带下色黄(白带颜色发黄)吗? （女性回答）" },
    { id: 7, textEn: "Does your private part area feel damp?", textCn: "您的阴囊部位潮湿吗? （男性回答）" },
  ],
  [
    // Part 7 / 9
    { id: 1, textEn: "Do you find your skin with purple spots out of sudden?", textCn: "您的皮肤常在不知不觉中出现青紫瘀斑(皮下出血)吗?" },
    { id: 2, textEn: "Do you have visible thin blood vessels on both sides of your cheekbone?", textCn: "您两颧部有细微红丝吗?" },
    { id: 3, textEn: "Do you feel pain on any part of your body?", textCn: "您身体上有哪里疼痛吗？" },
    { id: 4, textEn: "Do you find your face darker in tone or having dark brown spots on your face?", textCn: "您面色晦暗，或容易出现褐斑吗?" },
    { id: 5, textEn: "Do you have dark circles under your eye easily?", textCn: "您容易有黑眼圈吗?" },
    { id: 6, textEn: "Do you find your lips color dark?", textCn: "您口唇颜色偏黯吗?" },
    { id: 7, textEn: "Do you have difficulties remembering things?", textCn: "您容易忘事（健忘）吗？" },
  ],
  [
    // Part 8 / 9
    { id: 1, textEn: "Do you always feel something is bothering you making you unhappy?", textCn: "您感到闷闷不乐、情绪低沉吗? " },
    { id: 2, textEn: "Do you find yourself easily anxious?", textCn: "您容易精神紧张、焦虑不安吗?" },
    { id: 3, textEn: "Do you find yourself easily emotional?", textCn: "您多愁善感、感情脆弱吗？" },
    { id: 4, textEn: "Do you find yourself easily scared or frightened?", textCn: "您容易感到害怕或受到惊吓吗? " },
    { id: 5, textEn: "Do you feel fullness and pain around your chest area?", textCn: "您胁肋部胀痛吗?" },
    { id: 6, textEn: "Do you find yourself sigh out of sudden?", textCn: "您无缘无故叹气吗?" },
    { id: 7, textEn: "Do you have a feeling something stuck in your throat that you can't spit out or swallow?", textCn: "您咽喉部有异物感，且吐之不出、咽之不下吗？" },
  ],
  [
    // Part 9 / 9
    { id: 1, textEn: "Do you easily allergic (drugs, food, smell, pollen, temperature change)?", textCn: "您容易过敏(对药物、食物、气味、花粉或在季节交替、气候变化时)吗? " },
    { id: 2, textEn: "Do you sneeze often even when you are not having flu?", textCn: "您没有感冒时也会打喷嚏吗？" },
    { id: 3, textEn: "Do you have stuffy, running nose even when you are not having flu?", textCn: "您没有感冒时也会鼻塞、流鼻涕吗? " },
    { id: 4, textEn: "Do you have coughing or asthma especially during temperature or surrounding smell changes?", textCn: "您有因季节变化、温度变化或异味等原因而咳喘的现象吗？" },
    { id: 5, textEn: "Does your skin have itchy spots easily?", textCn: "您的皮肤容易起荨麻疹(风团、风疹块、风疙瘩)吗? " },
    { id: 6, textEn: "When you scratch your skin, does it appear red and scratch marks easily?", textCn: "您的皮肤一抓就红，并出现抓痕吗?" },
    { id: 7, textEn: "Do you find purple spots on your skin due to allergic reasons?", textCn: "您的皮肤因过敏出现过紫癜(紫红色瘀点、瘀斑)吗? " },
  ],
];

// define scales
const scaleOptions = ["No", "Seldom", "Sometimes", "Often", "Always"];

export default function QuestionnairePage() {
  const [answers, setAnswers] = useState<{ [key: string]: string }>({});
  const [currentPart, setCurrentPart] = useState<number>(0);
  const [currentQuestionId, setCurrentQuestionId] = useState<number | null>(null);

  const handleRadioChange = (partIndex: number, questionId: number, value: string) => {
    const key = `${partIndex}-${questionId}`;
    setAnswers((prev) => ({ ...prev, [key]: value }));
  };

  const currentQuestions = allQuestions[currentPart];
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

  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-24 bg-gray-200">
      <div className="z-10 max-w-2xl w-full items-center justify-center font-mono text-lg text-center bg-white shadow-md rounded-md p-8">
        <p className="mb-4 text-2xl font-semibold text-gray-800">TCM Scaled Questions</p>

        {/* TCM Scaled Questions content here */}

        <hr className="my-8 border-t border-gray-400" />

        <div className="mb-4">
          <p className="text-2xl font-semibold">Part {currentPart + 1}</p> {/* 添加部分标题 */}
        </div>

        {currentQuestions.map((question) => (
          <div
            key={question.id}
            className={`mb-6 ${currentQuestionId === question.id ? 'bg-yellow-100' : ''
              }`}
            onMouseEnter={() => setCurrentQuestionId(question.id)}
            onMouseLeave={() => setCurrentQuestionId(null)}
          >
            <p className="text-xl font-semibold">{question.textEn}</p>
            <p className="mb-2">{question.textCn}</p>
            <div className="flex justify-center items-center space-x-4">
              {scaleOptions.map((option, index) => (
                <label key={option} className="flex items-center">
                  <input
                    type="radio"
                    name={`q${question.id}`}
                    value={index + 1}
                    checked={answers[`${currentPart}-${question.id}`] === (index + 1).toString()}
                    onChange={() => handleRadioChange(currentPart, question.id, (index + 1).toString())}
                  />
                  <span className="ml-2">{option}</span>
                </label>
              ))}
            </div>
          </div>
        ))}

        <div className="flex justify-between mt-4">
          <button
            onClick={() => setCurrentPart((prev) => Math.max(prev - 1, 0))}
            className={`${currentPart === 0 ? 'invisible' : ''} bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded-md`}
          >
            Previous
          </button>
          {isLastPart ? (
            <button
              onClick={handleSubmit}
              className={`${isAllQuestionsAnswered ? 'bg-green-500 hover:bg-green-600' : 'bg-gray-300 cursor-not-allowed'
                } text-white font-semibold py-2 px-4 rounded-md`}
              disabled={!isAllQuestionsAnswered}
            >
              Submit
            </button>
          ) : (
            <button
              onClick={() => setCurrentPart((prev) => Math.min(prev + 1, allQuestions.length - 1))}
              className={`${currentPart === allQuestions.length - 1 ? 'invisible' : ''} bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded-md`}
            >
              Next
            </button>
          )}
        </div>
      </div>

      {/* Rest of your layout components (like the Image components and footer links) goes here ... */}
    </main>
  );
}