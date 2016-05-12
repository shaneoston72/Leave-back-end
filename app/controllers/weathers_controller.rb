require_relative '../../lib/weather_api'

class WeathersController < ApplicationController
  before_action :set_weather, only: [:show, :update, :destroy]

  def index
    @weather = get_weather
    render json: @weather
  end

  private

  def get_weather
    weather = WeatherApi.new.grab_json
    desc = weather['weather'][0]['description']
    temp = (weather['main']['temp'].to_i - 273.15).round(1)
    { description: desc, temperature: temp }.to_json
  end

  def set_weather
    @weather = Weather.find(params[:id])
  end

  def weather_params
    params[:weather]
  end
end
