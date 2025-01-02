class UserAnswerDetail < ApplicationRecord
  belongs_to :user_answer
  belongs_to :question

  validates :user_choice, presence: true
  validates :is_correct, inclusion: { in: [true, false] }
end
