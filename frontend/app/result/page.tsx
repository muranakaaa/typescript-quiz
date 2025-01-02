"use client";

import { useRouter, useSearchParams } from "next/navigation";

export default function ResultPage() {
  const searchParams = useSearchParams();
  // クエリパラメータからcorrect_rateを取得
  const correctRate = parseFloat(searchParams.get("correct_rate") || "0").toFixed(2);

  const router = useRouter();

  const retryQuiz = () => {
    router.push("/");
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center">
      <h1 className="text-3xl font-bold">結果</h1>
      <p className="mt-4 text-xl">正答率: {correctRate}%</p>
      <button
        onClick={retryQuiz}
        className="mt-6 px-6 py-2 bg-green-500 text-white rounded"
      >
        もう一度挑戦する
      </button>
    </div>
  );
}
