# frozen_string_literal: true

require 'yaml'
class ServiceArea
  VALID_KEYS = %w[lsoas outcodes].freeze
  def initialize(file_path: 'service_areas')
    @file_path = file_path
  end

  def service_area_details
    raise "No such file path like #{@file_path}.yaml." unless File.exist?("lib/#{@file_path}.yaml")

    data = YAML.load_file("lib/#{@file_path}.yaml")
    raise "No data exists in #{@file_path}.yaml." unless data

    data
  end
end
