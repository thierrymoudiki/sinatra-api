module NycAPI

  def self.getData(url)
    json_string_response = open(url).read
    #ruby_array_response = JSON.parse(json_string_response)
    return json_string_response
  end

  def self.format_population_data(json_string_response)
    array = JSON.parse(json_string_response)
    res = [{name:'population', data: []}]

      array.each do |elm|
        res[0][:data] << elm["new_york_city_population"].to_i
      end
    return res.to_json
  end

  def self.format_consumption_data(json_string_response)
    array = JSON.parse(json_string_response)
    res = [{name:'consumption', data: []}]

      array.each do |elm|
        res[0][:data] << elm["nyc_consumption_million_gallons_per_day"].to_i
      end
    return res.to_json
  end

end
