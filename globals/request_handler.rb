# frozen_string_literal: true

require 'faraday'
class RequestHandler
  def connection
    @connection = Faraday::Connection.new
  end

  def request(method:, url:, payload: {}, headers: {})
    resp = connection.public_send(method, url, payload, headers)
    OpenStruct.new(body: resp.body, status: resp.status)
  end
end
