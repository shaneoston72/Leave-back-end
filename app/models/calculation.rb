class Calculation

  def show_time_to_leave(arrival_time, duration, weather)
    travel_time = reformat(duration + get_delay(weather))
    update_time_to_leave(arrival_time, travel_time)
  end

  private

  def get_delay(weather)
    delays = [{code: 8, delay: 0}, {code: 5, delay: 15}, {code: 6, delay: 30}]
    weather_id = decode_weather_id(weather)
    delays.select {|pair| pair[:code] == weather_id }[0][:delay]
  end

  def decode_weather_id(weather)
    weather[:id] / 100
  end

  def reformat(travel_time)
     longer_than_an_hour?(travel_time) ? hours = travel_time / 60 : hours = 0
     { hours: hours, minutes: travel_time % 60 }
  end

  def longer_than_an_hour?(travel_time)
    travel_time >= 60
  end

  def update_time_to_leave(arrival_time, travel_time)
    minus_hour(arrival_time) if arrival_time[:minutes] == 0
    updated = arrival_time_minus_travel_time(arrival_time, travel_time)
    add_hour(updated) if updated[:minutes] == 60
    updated
  end

  def minus_hour(time_hash)
    time_hash[:minutes] += 60
    time_hash[:hours] -= 1
  end

  def add_hour(time_hash)
    time_hash[:minutes] = 0
    time_hash[:hours] += 1
  end

  def arrival_time_minus_travel_time(arrival_time, travel_time)
    { hours: arrival_time[:hours] - travel_time[:hours],
      minutes: (arrival_time[:minutes] - travel_time[:minutes]).abs }
  end

end
