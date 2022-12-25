# frozen_string_literal: true

module RocketReach
  Error = Class.new(StandardError)

  class HttpError < Error
    attr_reader :response

    def initialize(err)
      @response = err.response if err.respond_to?(:response)
      super(err)
    end

    def self.wrap(error)
      new(error)
    end
  end

  ClientError = Class.new(HttpError)
  ServerError = Class.new(HttpError)

  def self.wrap_error(faraday_error)
    case faraday_error
    when Faraday::ClientError
      ClientError.new(faraday_error)
    when Faraday::ServerError
      ServerError.new(faraday_error)
    else
      HttpError.new(faraday_error)
    end
  end
end
