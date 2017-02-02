class Question < ActiveRecord::Base
  has_many :votes
  has_many :comments
  has_many :answers
  belongs_to :user
  belongs_to :best_answer, class_name: "Answer", foreign_key: "answer_id"
end
