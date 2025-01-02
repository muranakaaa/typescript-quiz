class QuestionsController < ApplicationController
  def index
    questions = Question.order("RANDOM()").limit(10)
    render json: questions
  end
end
