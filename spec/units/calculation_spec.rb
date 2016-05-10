require_relative '../../app/models/calculation'

describe Calculation do

  let(:calculation) { described_class.new }

  let(:sunny_and_cloudy) { { id: 800 } }
  let(:rainy) { { id: 500 } }
  let(:snowy) { { id: 600 } }

  let(:arrival_time) { { hours: 9, minutes: 0 } }
  let(:duration) { 30 }

  describe '#update_calculation' do
    it 'returns (arrival time) - (travel result) for sunny/cloudy weather' do
      updated_time = calculation.show_time_to_leave(arrival_time,
                                                    duration,
                                                    sunny_and_cloudy)
      expect(updated_time).to eq({ hours: 8, minutes: 30 })
    end

    it 'returns time to leave 15min earlier if it is rainy' do
      updated_time = calculation.show_time_to_leave(arrival_time,
                                                    duration,
                                                    rainy)
      expect(updated_time).to eq({ hours: 8, minutes: 15 })
    end

    it 'returns time to leave 30min earlier if it is snowy' do
      updated_time = calculation.show_time_to_leave(arrival_time,
                                                    duration,
                                                    snowy)
      expect(updated_time).to eq({ hours: 8, minutes: 00 })
    end
  end
end
