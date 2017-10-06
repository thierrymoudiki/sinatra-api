# this library is best for making http requests
# and handling http responses:
require 'open-uri'

# this library is for handling json strings (parsing and creating):
require 'json'

# NYC Open Data: Water Consumption In The New York City API endpoint:
BASE_URL = "https://data.cityofnewyork.us/resource/waf7-5gvc.json"
json_string_response = open(BASE_URL).read
ruby_array_response = JSON.parse(json_string_response)
#p ruby_array_response

# number of rows
nb_rows =  ruby_array_response.length
# number of columns
nb_columns = ruby_array_response[0].length


def display(array)
  array.each_with_index do |elm, index|
   puts "id: #{index + 1} population: #{elm["new_york_city_population"].to_i} comsumption: #{elm["nyc_consumption_million_gallons_per_day"].to_i} per capita gallons per person per day:#{elm["per_capita_gallons_per_person_per_day"].to_i} year:#{elm["year"].to_i}"
   #puts "\n"
  end
end

def filter(array, criteria)
  res = []
  array.each_with_index do |elm, index|
   res = [elm["new_york_city_population"].to_i, elm["nyc_consumption_million_gallons_per_day"].to_i, elm["per_capita_gallons_per_person_per_day"].to_i] if elm["year"].to_i == criteria
   #puts "id: #{index + 1} population: #{elm["new_york_city_population"].to_i} comsumption: #{elm["nyc_consumption_million_gallons_per_day"].to_i} per capita gallons per person per day:#{elm["per_capita_gallons_per_person_per_day"].to_i} year:#{elm["year"].to_i}"
   #puts "\n"
  end
  return res
end


puts "\n"
puts "----- NYC water data consumption -----"
puts "\n"
puts "Select one option: "
puts "1 - Display all data"
puts "2 - Display data for a given year"
choice = gets.chomp.to_i
#while choice != "done"
  case choice
    when 1
      puts "choice 1 - displaying all data"
      display(ruby_array_response)
    when 2
      puts "choice 2 - Display data for a given year"
      puts "Which year do you want?"
      choice_year = gets.chomp.to_i
      res = filter(ruby_array_response, choice_year)
      puts "population: #{res[0]} millions"
      puts "consumption in million gallons per day: #{res[1]}"
      puts "per_capita_gallons_per_person per day: #{res[2]}"
    else
      puts "no idea what to do with #{choice}"
  end
#end
