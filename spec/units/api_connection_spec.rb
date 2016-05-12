require_relative '../../app/models/api_connection'

describe ApiConnection do

  let(:api_connection) { described_class.new }

  describe '#get_weather_id' do
    it 'calls on Weather API and returns weather id' do
      expect(api_connection.get_weather_id).to eq(801)
    end
  end

  describe '#get_travel_duration' do
    it 'calls on Travel API and returns travel duration' do
      expect(api_connection.get_travel_duration(1000004, 1000241)).to eq(32)
    end
  end
end
