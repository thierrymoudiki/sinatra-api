get '/' do
  erb :index
end

# This route is for registration
post '/' do
  puts params
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    erb :index
  else
    erb :index
  end
end

# This route is for logging in
post '/login' do
  puts params
  @user = User.find_by(username: params[:username])
  session[:id] = @user.id
  session.inspect
  erb :index
end
