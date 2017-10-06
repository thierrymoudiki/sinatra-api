get '/' do
  erb :index
end

get '/users/new' do
  redirect '/'
end

get '/users/login' do
  redirect '/'
end

post '/users' do

end

post '/users/login' do

end
