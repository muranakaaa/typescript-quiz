"use client";

import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";
import axios from "../../lib/axios";

interface Question {
  id: number;
  content: string;
  option1: string;
  option2: string;
  option3: string;
  option4: string;
}

export default function QuizPage() {
  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<{ question_id: number; user_choice: number }[]>([]);
  const router = useRouter();

  useEffect(() => {
    axios.get("/questions").then((response) => {
      setQuestions(response.data);
    });
  }, []);

  const handleAnswer = (choice: number) => {
    const currentQuestion = questions[currentIndex];
    setAnswers([...answers, { question_id: currentQuestion.id, user_choice: choice }]);

    if (currentIndex < 9) {
      setCurrentIndex(currentIndex + 1);
    } else {
      axios.post("/user_answers", { answers }).then((response) => {
        router.push(`/result?correct_rate=${response.data.correct_rate}`);
      });
    }
  };

  if (questions.length === 0) return <p>Loading...</p>;

  const currentQuestion = questions[currentIndex];

  return (
    <div className="min-h-screen flex flex-col items-center justify-center">
      <h1 className="text-xl font-bold">問題 {currentIndex + 1}/10</h1>
      <p className="mt-4">{currentQuestion.content}</p>
      <div className="mt-6 flex flex-col space-y-4">
        {[1, 2, 3, 4].map((num) => (
          <button
            key={num}
            onClick={() => handleAnswer(num)}
            className="px-4 py-2 bg-blue-500 text-white rounded"
          >
            {currentQuestion[`option${num}` as keyof Question]}
          </button>
        ))}
      </div>
    </div>
  );
}
