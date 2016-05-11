require 'factory_girl_rails'
require 'support/factory_girl'
require 'webmock/rspec'

RSpec.configure do |config|

  WebMock.disable_net_connect!(allow_localhost: true)

  config.before(:each) do
    mock_body =  { "weather" => [{ "id": 801, "description": "few clouds" }],
                   "main"    => { "temp": 291.563 }
                 }.to_json
    weather_api_key = ENV['WEATHER_API_KEY']
    stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?q=London&appid=" + weather_api_key)
    .with(headers: { 'Accept': '*/*',
                     'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                     'User-Agent': 'Ruby' })
      .to_return(status: 200,
                 body: mock_body,
                 headers: {})
  end

  config.before(:each) do
    mock_body =  { "journeys" => [{ "startDateTime": "2016-05-06T08:42:00",
                                    "duration": 32,
                                    "arrivalDateTime": "2016-05-06T09:14:00" }],
                   "lines" => [{ "name": "District",
                                 "lineStatuses" => [{ "statusSeverity": 10,
                                                      "statusSeverityDescription": "Good Service" }]
                              }]
                  }.to_json
    stub_request(:get, "https://api.tfl.gov.uk/journey/journeyresults/1000004/to/1000241")
      .with(headers: { 'Accept': '*/*',
                       'Accept-Encoding': 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                       'User-Agent': 'Ruby' })
      .to_return(status: 200,
                 body: mock_body,
                 headers: {})
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:all) do
    FactoryGirl.reload
  end

end
