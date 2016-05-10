FactoryGirl.define do

  factory :alarm do
    from_station '10000'
    to_station '20000'
    arrival_time '14:30'
    alarm_offset '30'
  end

end
