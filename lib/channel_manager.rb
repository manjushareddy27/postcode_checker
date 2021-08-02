# frozen_string_literal: true

require 'sinatra'
require 'rack'
require 'rack/contrib'

class ChannelManager < Sinatra::Base
  set :views, (proc {  'lib/views' })

  get '/' do
    erb :form, layout: :application_layout
  end

  post '/check' do
    postcode = params[:postcode]
    result = PostcodeChecker.new(postcode).valid?

    { message: result }.to_json
  end
end
