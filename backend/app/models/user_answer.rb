class UserAnswer < ApplicationRecord
  has_many :user_answer_details, dependent: :destroy
end
