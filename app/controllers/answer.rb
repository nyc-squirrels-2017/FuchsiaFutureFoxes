get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  erb :'/comments/answer', locals: {commentable: @answer}
end

post '/answers/:id/comments' do
  @answer = Answer.find(params[:id])
  @user = current_user
  @comment = Comment.new(params[:commentable])
  @comment.commentable_id = @answer.id
  @comment.commentable_type = 'Answer'
  @comment.user = @user
  # binding.pry
  if @comment.save
    redirect "/questions/#{@answer.question.id}"
  else
    erb :"/comments/new"
  end
end
