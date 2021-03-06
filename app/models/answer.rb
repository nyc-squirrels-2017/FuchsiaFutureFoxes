class Answer < ActiveRecord::Base
  validates :description, presence: true
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  belongs_to :user
  belongs_to :question

  def total_value
    self.votes.reduce(0){|total, vote| total + vote.value}
  end 
end
