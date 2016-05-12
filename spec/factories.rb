FactoryGirl.define do

  factory :alarm do
    from_station '1000004'
    to_station '1000241'
    arrival_time '14:30'
    alarm_offset '0'
  end
end
