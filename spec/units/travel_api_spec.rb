require_relative '../../lib/travel_api'

describe TravelApi do

  let(:travel_api) { described_class.new(1000004, 1000241) }

  before(:each) do
    @raw_json = travel_api.grab_json
  end

  describe '#grab_json' do
    it 'returns a json object with status severity' do
      expect(@raw_json.keys. include?('journeys' && 'lines')).to eq(true)
    end
  end

  # describe '#show_duration' do
  #   it 'displays the duration of the travel time' do
  #     duration = travel_api_call.show_duration
  #     expect(duration.class).to eq (Fixnum)
  #   end
  # end
  #
  # describe '#show_line_statuses' do
  #   it 'displays the statuses of lines used in the journey' do
  #     line_statuses = travel_api_call.show_line_statuses
  #     expect(line_statuses).to eq ({ "District" => 10 })
  #   end
  # end

end
