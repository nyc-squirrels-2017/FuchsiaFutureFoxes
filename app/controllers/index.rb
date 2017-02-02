get '/' do
  @questions = Question.all.reverse
  @users = User
  erb :'index'
end
