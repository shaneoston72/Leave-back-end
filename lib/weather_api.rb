require 'httparty'
require 'dotenv'
require 'json'
Dotenv.load

class WeatherApi

  include HTTParty

  def initialize
    @base_uri = ENV['WEATHER_BASE_URL']
    @options = { city_name: 'London', api_key: ENV['WEATHER_API_KEY'] }
    @raw_json = ''
  end

  def grab_json
    @raw_json = self.class.get(@base_uri +
                               "?q=#{ @options[:city_name] }" +
                               "&appid=#{ @options[:api_key] }").parsed_response
    @raw_json = JSON(@raw_json) if @raw_json.class == String
  end

end
