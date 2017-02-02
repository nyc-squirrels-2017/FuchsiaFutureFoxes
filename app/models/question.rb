class Question < ActiveRecord::Base
  validates :title, :description, presence: true
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :user
  belongs_to :best_answer, class_name: "Answer", foreign_key: "answer_id"
end
