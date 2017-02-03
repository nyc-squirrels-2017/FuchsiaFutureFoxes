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

# post '/answers/:id/upvote' do
#   # binding.pry
#    @answer = Question.find(params[:id])
#    @answer.votes.create(user_id: session[:user_id], value: 1)
#    redirect '/answers'
# end
#
#
# post '/answers/:id/downvote' do
#    @answer = Question.find(params[:id])
#    @answer.votes.create(user_id: session[:user_id], value: -1)
#    redirect '/answers'
# end
