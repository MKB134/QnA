class Answer < ApplicationRecord
  belongs_to :question

  validates :question_id, presence: true
  validates :body, presence: {message: "Answer can't be blank"}
end
