get '/questions' do
  @questions = Question.all.reverse
  @users = User.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions' do
  # "hello"
  @user = current_user
  @question = Question.new(params[:question]) #create new question
  @question.user = @user

  if @question.save
    redirect '/questions'
  else
    binding.pry
    erb :'/questions/new' # show new questions view again(potentially displaying errors)
  end
end
