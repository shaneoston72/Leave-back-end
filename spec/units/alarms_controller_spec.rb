describe AlarmsController do

  let(:calculation_class) { double(:calculation_class, new: calculation) }
  let(:calculation) { double(:calculation, show_time_to_leave: nil) }
  let(:alarm_params) { { from_station: '10000',
                       to_station: '20000',
                       arrival_time: '14:30',
                       alarm_offset: '0'} }
  let(:alarm_class) { double(:alarm_class, new: alarm) }
  let(:alarms_controller) { described_class.new }
  let(:alarm){ build(:alarm) }


  # describe '#create' do
  #   it 'instantiates a calculation object' do
  #     alarms_controller.create
  #     expect(calculation_class).to have_received(:new)
  #   end
  # end
end
