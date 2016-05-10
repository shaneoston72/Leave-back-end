require 'csv'

class StationList

 attr_accessor :file

 def initialize(data ='lib/assets/tflList.csv')
   @file = data
 end

 def station_list
   convert_csv
 end

 private

 def convert_csv
   array = csv_to_array_of_hashes(file)
 end

 def csv_to_array_of_hashes(file)
   csv = CSV::parse(File.open(file, 'r') {|f| f.read })
   fields = csv.shift
   csv.collect { |record| Hash[*fields.zip(record).flatten ] }
 end


end
