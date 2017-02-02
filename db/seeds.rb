User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

user1 = User.create!({
  :username => "benjimon",
  :email => "benjimon@digimon.com",
  :password => "digimon"
  })

answer1 = Answer.create!({
  :description => "Pokemon Silver",
  :user_id => 1,
  :question_id => 1
  })

question1 = Question.create!({
  :title => "What is the best pokemon game?",
  :description => "Idk which one to play?",
  :user_id => 1,
  :answer_id => 1
  })

comment1 = Comment.create!({
  :description => "hello",
  :user_id => user1.id,
  :commentable_id => question1.id,
  :commentable_type => question1.class
  })

vote1 = Vote.create!({
  :user_id => user1.id,
  :voteable_id => answer1.id,
  :voteable_type => answer1.class,
  :value => 1
  })
