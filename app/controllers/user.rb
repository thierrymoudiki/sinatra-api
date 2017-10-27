# Root page
get '/' do
  erb :'index'
end

# User registration page
get '/signup' do
  erb :'/signup'
end

post '/signup' do
  @user = User.new(username: params[:user][:username],
                   password: params[:user][:password])
  if @user.save
    erb :'/new'
  else
    @errors = @user.errors.full_messages
    erb :'/signup'
  end
end

# User login page
get '/login' do
  erb :'/login'
end

post '/login' do
  # Search the user in registered users db
  @user = User.find_by(username: params[:user][:username])
  # If the user is found and the password is correct,
  # put the user's id in session's hash and go to the homepage
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/home'
  else
    if @user
      @errors = @user.errors.full_messages
      erb :'/login'
     else
      erb :'/err_login'
     end
  end
end

get '/home' do
  # Find the user wh's logged in
  @user = User.find_by(id: session[:user_id])
  erb :'/home'
end

get '/logout' do
  session.clear
  redirect '/'
end
