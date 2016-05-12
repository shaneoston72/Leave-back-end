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
    prepare_time_and_station_data
    calculation    = calculation_class.new(@arrival_time, @from_station, @to_station)
    @time_to_leave = { time_to_leave: calculation.show_time_to_leave }.to_json
  end

  def prepare_time_and_station_data
    format_arrival_time
    extract_station_code
  end

  def format_arrival_time
    @arrival_time = { hours: @alarm.arrival_time[0,2].to_i,
                      minutes: @alarm.arrival_time[3,2].to_i }
  end

  def extract_station_code
    @from_station = @alarm.from_station.to_i
    @to_station   = @alarm.to_station.to_i
  end

  def alarm_params
    params.require(:alarm).permit(:from_station, :to_station, :arrival_time, :alarm_offset)
  end
end
