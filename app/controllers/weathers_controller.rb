require_relative '../../lib/weather_api'

class WeathersController < ApplicationController
  before_action :set_weather, only: [:show, :update, :destroy]

  def index
    @weather = get_weather
    render json: @weather
  end

  private

  def get_weather
    raw_weather_info = WeatherApi.new.grab_json
    create_weather_json(raw_weather_info)
  end

  def create_weather_json(raw_json)
    description = get_description(raw_json)
    temperature = get_temperature(raw_json)
    { description: description, temperature: temperature }.to_json
  end

  def get_description(raw_json)
    raw_json['weather'][0]['description']
  end

  def get_temperature(raw_json)
    (raw_json['main']['temp'].to_i - 273.15).round(1)
  end

end
