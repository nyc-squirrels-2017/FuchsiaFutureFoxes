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

get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'/answers/new'
end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @user = current_user
  @answer = Answer.new(params[:answer])
  @answer.question_id = @question.id
  @answer.user = @user
  # binding.pry

  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :"/answers/new"
  end
end

get '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  erb :'/comments/new', locals: {commentable: @question}
end

post '/questions/:id/comments' do
  @question = Question.find(params[:id])
  @user = current_user
  @comment = Comment.new(params[:commentable])
  @comment.commentable_id = @question.id
  @comment.commentable_type = 'Question'
  @comment.user = @user
  # binding.pry
  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    erb :"/comments/new"
  end
end
