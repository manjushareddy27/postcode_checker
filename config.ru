# frozen_string_literal: true

require './config/environment'
Dir[File.join(__dir__, '**/*.rb')].sort.each { |f| require f }

run ChannelManager
use Rack::PostBodyContentTypeParser
