# frozen_string_literal: true

require 'bundler/setup'
Bundler.require(:default, 'development')

Dir[File.join(__dir__, '**/*.rb')].sort.each { |f| require f }
