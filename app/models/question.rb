class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates :title, :body, presence: true
end
