"use client"
import { useRouter } from "next/navigation";

export default function Home() {
  const router = useRouter();

  const startQuiz = () => {
    router.push("/quiz");
  };

  return (
    <div className="flex flex-col items-center justify-center min-h-screen">
      <h1 className="text-3xl font-bold">TypeScript クイズ</h1>
      <button
        onClick={startQuiz}
        className="mt-4 px-6 py-2 bg-blue-500 text-white rounded"
      >
        クイズを開始
      </button>
    </div>
  );
}
