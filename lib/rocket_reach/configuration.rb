# frozen_string_literal: true

module RocketReach
  class Configuration
    attr_accessor :api_key
    attr_writer :connection

    def connection
      return @connection if @connection

      @connection =
        Faraday.new(url: "https://api.rocketreach.co/") do |c|
          c.use Faraday::Response::RaiseError
          c.options.timeout = 20 # open/read timeout in seconds
          c.options.open_timeout = 20 # connection open timeout in seconds
        end
    end
  end
end
