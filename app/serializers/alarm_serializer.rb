class AlarmSerializer < ActiveModel::Serializer
  attributes :id, :from_station, :to_station, :arrival_time, :alarm_offset
end
