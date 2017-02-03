post '/questions/:id/upvote' do
   @question = Question.find(params[:id])
   @question.votes.create(user_id: session[:user_id], value: 1)
   redirect '/questions'
end


post '/questions/:id/downvote' do
   @question = Question.find(params[:id])
   @question.votes.create(user_id: session[:user_id], value: -1)
   redirect '/questions'
end

post '/answers/:id/upvote' do
   @answer = Answer.find(params[:id])
   @answer.votes.create(user_id: session[:user_id], value: 1)
   redirect "/questions/#{@answer.question.id}"
end


post '/answers/:id/downvote' do
   @answer = Answer.find(params[:id])
   @answer.votes.create(user_id: session[:user_id], value: -1)
   redirect "/questions/#{@answer.question.id}"
end
