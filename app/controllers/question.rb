get '/questions' do
  @questions = Question.all.reverse
  @users = User
  erb :'questions/index'
end
