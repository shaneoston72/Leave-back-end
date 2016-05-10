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
    convert_json_to_hash if @raw_json.class == String
    @raw_json
  end

  def show_desc_and_temp
    desc = extract_description
    temp = extract_temperature
    { description: desc, temperature: temp }.to_json
  end

  def show_id
    { id: @raw_json['weather'][0]['id'] }
  end

  private

  def convert_json_to_hash
    @raw_json = JSON(@raw_json)
  end

  def extract_description
    @raw_json['weather'][0]['description']
  end

  def extract_temperature
    (@raw_json['main']['temp'].to_i - 273.15).round(1)
  end
end

weather = WeatherApi.new
p weather.grab_json
