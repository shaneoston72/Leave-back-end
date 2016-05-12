require_relative '../../lib/weather_api'

class WeathersController < ApplicationController
  before_action :set_weather, only: [:show, :update, :destroy]

  def index
    @weather = get_weather
    render json: @weather
  end

  private

  def get_weather
    weather = WeatherApi.new
    weather.grab_json
    weather.show_desc_and_temp
  end
end
