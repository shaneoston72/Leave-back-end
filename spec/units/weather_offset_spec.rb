require_relative '../../app/models/weather_offset'

describe WeatherOffset do

  let(:weather_offset) { described_class.new }

  let(:sunny_and_cloudy) { 800 }
  let(:rainy) { 500 }
  let(:snowy) { 600 }

  describe '#calculate_delay' do
    it 'returns zero minute for sunny and cloudy weather' do
      expect(weather_offset.calculate_delay(sunny_and_cloudy)).to eq 0
    end
    it 'returns 15 minute for sunny and cloudy weather' do
      expect(weather_offset.calculate_delay(rainy)).to eq 15
    end
    it 'returns 30 minute for sunny and cloudy weather' do
      expect(weather_offset.calculate_delay(snowy)).to eq 30
    end
  end
end
