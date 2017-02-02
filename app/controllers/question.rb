get '/questions' do
  @questions = Question.all.reverse
  @users = User.all
  erb :'questions/index'
end
