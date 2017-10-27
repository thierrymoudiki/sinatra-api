get '/data/consumption' do
  erb :'/home'
end

post '/data/consumption' do
  if request.xhr?
    BASE_URL = "https://data.cityofnewyork.us/resource/waf7-5gvc.json"
    @data = NycAPI::format_consumption_data(NycAPI::getData(BASE_URL))
    #binding.pry
  else
    p "DEBUG: It's NOT xhr!"
  end
end

get '/data/population' do
  erb :'/home'
end

post '/data/population' do
  if request.xhr?
    BASE_URL = "https://data.cityofnewyork.us/resource/waf7-5gvc.json"
    @data = NycAPI::format_population_data(NycAPI::getData(BASE_URL))
    #binding.pry
  else
    p "DEBUG: It's NOT xhr!"
  end
end
