# frozen_string_literal: true

require_relative '../globals/request_handler'
require_relative 'service_area'
require 'json'
BASE_URL = 'https://api.postcodes.io/postcodes'
class PostcodeChecker
  def initialize(postcode)
    @postcode = postcode.gsub(/\s+/, '')
  end

  def valid?
    return 'Please enter a postcode.' if postcode.empty?

    response = JSON.parse(send_request.body)['result']
    validate_response(response)
  rescue Faraday::Error => e
    raise "Request Error: #{e.response[:body]}"
  rescue StandardError => e
    raise "Internal server error: #{e.message}"
  end

  def send_request
    RequestHandler.new.request(method: 'get',
                               url: "#{BASE_URL}/#{postcode}",
                               headers: headers)
  end

  def validate_response(resp)
    return 'Entered postcode is not in our service area.' unless check_postcode(resp)

    'Entered postcode is in our service area.'
  end

  def check_postcode(resp)
    valid_lsoa?(resp) || outcode?
  end

  def valid_lsoa?(resp)
    return false if resp.nil?

    service_area_data['lsoas'].any? { |e| resp['lsoa'].downcase.split.include? e.downcase }
  end

  # when we are searching for outcode postcode means the response from Postcodes API is null
  def outcode?
    service_area_data['outcodes'].any? { |e| postcode.upcase.include? e.upcase }
  end

  private

  attr_reader :postcode

  def headers
    {
      'Content-Type': 'application/json',
      'User-Agent': 'postcode_checker_request'
    }
  end

  def service_area_data
    @service_area_data ||= ServiceArea.new.service_area_details
  end
end
