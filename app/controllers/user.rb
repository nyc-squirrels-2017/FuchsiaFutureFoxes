get '/users/new' do
  erb :'users/new' #show new user view
end

post '/users' do #new user post request
  @user = User.new(params[:user])
  if @user.save #saves new user or returns false if unsuccessful
    session[:user_id] = @user.id
    redirect '/questions'
  else
    @errors = @user.errors.full_messages
    erb :'users/new' # show new user view again(potentially displaying errors)
  end
end

get '/users/login' do #user login route
  erb :'users/login'
end

post '/users/login' do #user login post request
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Username and password did not match"]
    erb :'users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end

get '/users/profile' do
  erb :'users/profile'
end

get '/users/:id' do
  @user = User.find(params[:id]) #define instance variable for view
  erb :'users/profile' #show single user view
end
