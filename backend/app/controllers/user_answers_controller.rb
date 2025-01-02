class UserAnswersController < ApplicationController
  def create
    user_answer = UserAnswer.create!
    correct_count = 0

    params[:answers].each do |answer|
      question = Question.find(answer[:question_id])
      is_correct = (answer[:user_choice] == question.correct)
      correct_count += 1 if is_correct

      user_answer.user_answer_details.create!(
        question: question,
        user_choice: answer[:user_choice],
        is_correct: is_correct
      )
    end

    correct_rate = (correct_count.to_f / params[:answers].size) * 100
    render json: { correct_rate: correct_rate }
  end
end
