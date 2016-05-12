require_relative '../../app/models/calculation'

describe Calculation do

  let(:arrival_time) { { hours: 9, minutes: 0 } }
  let(:from_station) { 1000004 }
  let(:to_station) { 1000241 }
  let(:api_connection_class) { double(:api_connection_class, new: api_connection) }
  let(:api_connection) { double(:api_connection) }

  let(:calculation) { described_class.new(arrival_time, from_station, to_station) }


  describe '#initialize' do
    it 'instantiates a calculation object with arrival time' do
      expect(calculation.arrival_time).to eq arrival_time
    end
    it 'instantiates a calculation object with from station' do
      expect(calculation.from_station).to eq from_station
    end
    it 'instantiates a calculation object with to station' do
      expect(calculation.to_station).to eq to_station
    end
  end


  describe '#show_time_to_leave' do
    it 'calls on make_api_call' do
      calculation
    end

    it 'returns (arrival time) - (travel result) for sunny/cloudy weather' do
      updated_time = calculation.show_time_to_leave(arrival_time,
                                                    from_station,
                                                    to_station)
      expect(updated_time).to eq('08:28')
    end
  end

end
