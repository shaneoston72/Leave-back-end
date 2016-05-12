require 'api_connection'

class Calculation

  attr_reader :arrival_time, :from_station, :to_station

  def initialize(arrival_time, from_station, to_station)
    @arrival_time = arrival_time
    @from_station = from_station
    @to_station = to_station
  end

  def show_time_to_leave(arrival_time, from_station, to_station)
    make_api_call(from_station, to_station)
    travel_time = @travel_duration + get_delay(@weather_id)
    update_time_to_leave(arrival_time, travel_time)
  end

  private

  def convert_time_to_minutes(time)
    time[:hours] * 60 + time[:minutes]
  end

  def get_delay(weather_id)
    delays = [{code: 8, delay: 0}, {code: 5, delay: 15}, {code: 6, delay: 30}]
    delays.select {|pair| pair[:code] == weather_id/100 }[0][:delay]
  end

  def update_time_to_leave(arrival_time, travel_time)
    arrival_time_in_minutes = convert_time_to_minutes(arrival_time)
    time_to_leave_in_minutes = arrival_time_in_minutes - travel_time
    convert_minutes_to_time(time_to_leave_in_minutes)
  end

  def convert_minutes_to_time(minutes)
    hours = "#{minutes / 60}"
    minutes = "#{minutes % 60}"
    format_time_to_string(hours, minutes)
  end

  def format_time_to_string(hours, minutes)
    hours = '0' + hours if hours.length == 1
    minutes = '0' + minutes if minutes.length == 1
    "#{hours}:#{minutes}"
  end

  def make_api_call(from_station,
                    to_station,
                    api_connection_class = ApiConnection)
    api_connection = api_connection_class.new
    @weather_id = api_connection.get_weather_id
    @travel_duration = api_connection.get_travel_duration(from_station, to_station)
  end

end
