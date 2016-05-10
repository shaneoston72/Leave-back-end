require 'rails_helper'

describe "Alarm API" do
  it 'sends an alarm info' do
    alarm = create(:alarm)
    get '/alarms'
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json[0]['alarm_offset']).to eq('30')
  end
end
