require 'rails_helper'

describe "Weathers Controller" do
  it 'sends an alarm info' do
    get '/weathers'
    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json.include?('description' && 'temperature')).to eq true
  end
end
