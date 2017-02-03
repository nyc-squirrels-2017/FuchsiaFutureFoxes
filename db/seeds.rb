User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

# user1 = User.create!({
#   :username => "benjimon",
#   :email => "benjimon@digimon.com",
#   :password => "digimon"
#   })
#
# answer1 = Answer.create!({
#   :description => "Pokemon Silver",
#   :user_id => 1,
#   :question_id => 1
#   })
#
# question1 = Question.create!({
#   :title => "What is the best pokemon game?",
#   :description => "Idk which one to play?",
#   :user_id => 1,
#   :answer_id => 1
#   })
#
# comment1 = Comment.create!({
#   :description => "hello",
#   :user_id => user1.id,
#   :commentable_id => question1.id,
#   :commentable_type => question1.class
#   })
#
# vote1 = Vote.create!({
#   :user_id => user1.id,
#   :voteable_id => answer1.id,
#   :voteable_type => answer1.class,
#   :value => 1
#   })



10.times do (
   user = User.create!({
    :username => Faker::Internet.user_name,
    :email =>  Faker::Internet.safe_email,
    :password => Faker::Internet.password(8)
    })

  answer =  Answer.create!({
      :description => Faker::Lorem.sentence,
      :user_id => rand(1..11),
      :question_id => rand(1..11)
      })

  question =  Question.create!({
        :title => Faker::Name.title,
        :description => Faker::Lorem.sentence,
        :user_id => rand(1..11),
        :answer_id => rand(1..11)
        })

    Comment.create!({
         :description => Faker::Lorem.sentence,
         :user_id => user.id,
         :commentable_id => question.id,
         :commentable_type => question.class
         })

    Vote.create!({
         :user_id => user.id,
         :voteable_id => answer.id,
         :voteable_type => answer.class,
         :value => 1
         })
)
end
