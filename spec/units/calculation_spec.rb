require_relative '../../app/models/calculation'

describe Calculation do

  let(:arrival_time) { { hours: 9, minutes: 0 } }
  let(:from_station) { 1000004 }
  let(:to_station) { 1000241 }

  let(:calculation) { described_class.new(arrival_time, from_station, to_station) }

  let(:sunny_and_cloudy) { 800  }
  let(:rainy) { 500 }
  let(:snowy) { 600 }

  let(:duration) { 30 }

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
    it 'returns (arrival time) - (travel result) for sunny/cloudy weather' do
      updated_time = calculation.show_time_to_leave(arrival_time,
                                                    duration,
                                                    sunny_and_cloudy)
      expect(updated_time).to eq('08:30')
    end

    it 'returns time to leave 15min earlier if it is rainy' do
      updated_time = calculation.show_time_to_leave(arrival_time,
                                                    duration,
                                                    rainy)
      expect(updated_time).to eq('08:15')
    end

    it 'returns time to leave 30min earlier if it is snowy' do
      updated_time = calculation.show_time_to_leave(arrival_time,
                                                    duration,
                                                    snowy)
      expect(updated_time).to eq('08:00')
    end
  end
end
