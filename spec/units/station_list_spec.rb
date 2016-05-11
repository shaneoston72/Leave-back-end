require_relative '../../lib/station_list'
require 'csv'

describe StationList do

 describe '#station_list' do

   subject(:list) { described_class.new(data = "spec/tflList.csv") }

   it 'creates a hash of station codes & names from a csv' do
     expect(subject.station_list).to be_a Array
   end
 end
end
