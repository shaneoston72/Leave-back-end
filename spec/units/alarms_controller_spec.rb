describe AlarmsController do

  let(:alarms_controller) { described_class.new }
  let(:calculation_class) { double(:calculation_class, new: calculation) }
  let(:calculation) { doube :calculation }

  describe '#create' do
    it 'instantiates a calculation object' do
      alarms_controller.create

    end
  end
end
