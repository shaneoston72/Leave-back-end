class WeatherOffset

  def calculate_delay(weather_id)
    delays = [{code: 8, delay: 0}, {code: 5, delay: 15}, {code: 6, delay: 30}]
    delays.select {|pair| pair[:code] == weather_id/100 }[0][:delay]
  end
end
