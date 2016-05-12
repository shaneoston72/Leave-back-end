require_relative '../models/calculation'
require 'json'


class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :update, :destroy]

  attr_accessor :alarm

  def index
    @alarm = Alarm.last
    calculate_time_to_leave
    render json: @time_to_leave
  end

  def create
    alarm = Alarm.new(alarm_params)
    if alarm.save
      render json: alarm, status: :created, location: alarm
    else
      render json: alarm.errors, status: :unprocessable_entity
    end
  end

  private

  def calculate_time_to_leave(calculation_class = Calculation)
    # get_travel_duration
    # get_weather_id
    format_arrival_time
    calculation    = calculation_class.new(from_station, to_station, @arrival_time)
    # @time_to_leave = { time_to_leave: calculation.show_time_to_leave(@arrival_time) }.to_json
    @time_to_leave = { time_to_leave: calculation.show_time_to_leave(@arrival_time, @duration, @weather_id) }.to_json
  end

  def format_arrival_time
    @arrival_time = { hours: @alarm.arrival_time[0,2].to_i,
                      minutes: @alarm.arrival_time[3,2].to_i }
  end

  def get_travel_duration
    from_station = @alarm.from_station.to_i
    to_station   = @alarm.to_station.to_i
    travel       = TravelApi.new(from_station, to_station).grab_json
    @duration    = travel['journeys'][0]['duration']
  end

  def get_weather_id
    @weather_id = WeatherApi.new.grab_json['weather'][0]['id']
  end

  def alarm_params
    params.require(:alarm).permit(:from_station, :to_station, :arrival_time, :alarm_offset)
  end
end
