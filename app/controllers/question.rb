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
