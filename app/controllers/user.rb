get '/' do
  erb :index
end

# This route is for registration
post '/' do
  @user = User.new(params[:user])
  if @user.save
    erb :index
  else
    erb :index
  end
end

# This route is for logging in
post '/login' do
  @user = User.find_by(params[:user])
  session[:id] = @user.id
  session.inspect
  erb :index
end
