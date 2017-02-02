get '/user/new' do
  erb :'user/new' #show new user view
end

post '/user' do
  @user = User.new(params[:user])
  if @user.save #saves new user or returns false if unsuccessful
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'user/new' # show new user view again(potentially displaying errors)
  end
end
