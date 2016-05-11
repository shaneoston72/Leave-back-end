require 'rails_helper'

describe "Alarms Controller" do
  it 'sends an alarm info' do
    alarm = create(:alarm)
    get '/alarms'
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json.include?('time_to_leave')).to eq true
  end
end
