require_relative '../../lib/weather_api'
require_relative '../../lib/travel_api'

class ApiConnection

  def get_weather_id(weather_api_class = WeatherApi)
    @weather_id = weather_api_class.new.grab_json['weather'][0]['id']
  end

  def get_travel_duration(from_station,
                          to_station,
                          travel_api_class = TravelApi)
    travel       = travel_api_class.new(from_station, to_station).grab_json
    @duration    = travel['journeys'][0]['duration']
  end

end
