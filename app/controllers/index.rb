get '/' do
  @questions = Question.all.reverse
  erb :'index'
end
