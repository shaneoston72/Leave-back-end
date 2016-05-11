require_relative '../../lib/weather_api'

describe WeatherApi do

  let(:weather_api) { described_class.new }

  before(:each) do
    @raw_json = weather_api.grab_json
  end

  describe '#grab_json' do
    it 'returns a hash object with id, description and temp data' do
      expect(@raw_json.keys.include?('weather' && 'main')).to eq(true)
    end
  end

  describe '#show_desc_and_temp' do
    it 'returns description and temp' do
      desc_and_temp = weather_api.show_desc_and_temp
      expect(desc_and_temp.include?('description' && 'temp')).to eq(true)
    end
  end

  describe '#show_id' do
    it 'returns id' do
      id = weather_api.show_id
      expect(id[:id].class).to eq(Fixnum)
    end
  end

end
