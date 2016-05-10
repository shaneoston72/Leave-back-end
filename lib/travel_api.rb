require 'httparty'
require 'dotenv'
require 'json'
Dotenv.load

class TravelApi

  include HTTParty

  def initialize(from, to)
    @base_uri = "#{ENV['TFL_BASE_URL']}#{from.to_s}/to/#{to.to_s}"
    @raw_json = ''
  end

  def grab_json
    @raw_json = self.class.get(@base_uri).parsed_response
    convert_json_to_hash if @raw_json.class == String
  end

  def show_duration
    @raw_json['journeys'][0]['duration']
  end

  def show_line_statuses
    extract_lines_info
  end

  private

  def convert_json_to_hash
    @raw_json = JSON(@raw_json)
  end

  def extract_lines_info
    statuses = {}
    @raw_json['lines'].each { |line| statuses[line["name"]] = line["lineStatuses"][0]["statusSeverity"]}
    statuses
  end
end
