require_relative '../../lib/weather_api'

class WeathersController < ApplicationController
  before_action :set_weather, only: [:show, :update, :destroy]

  def index
    @weather = get_weather
    render json: @weather
  end

  def show
    render json: @weather
  end

  def create
    @weather = Weather.new(weather_params)
    if @weather.save
      render json: @weather, status: :created, location: @weather
    else
      render json: @weather.errors, status: :unprocessable_entity
    end
  end

  def update
    @weather = Weather.find(params[:id])
    if @weather.update(weather_params)
      head :no_content
    else
      render json: @weather.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @weather.destroy
    head :no_content
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
