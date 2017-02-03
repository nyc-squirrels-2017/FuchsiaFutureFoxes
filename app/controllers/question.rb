get '/questions' do
  @questions = Question.all.reverse
  @users = User.all
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

post '/questions/:id/upvote' do
  # binding.pry
   @question = Question.find(params[:id])
   @question.votes.create(user_id: session[:user_id], value: 1)
   redirect '/questions'
end


post '/questions/:id/downvote' do
   @question = Question.find(params[:id])
   @question.votes.create(user_id: session[:user_id], value: -1)
   redirect '/questions'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions/new' do
  @user = current_user
  @question = Question.new(params[:question]) #create new question
  @question.user = @user
  if @question.save
    redirect '/questions'
  else
    erb :'questions/new' # show new questions view again(potentially displaying errors)
  end
end
