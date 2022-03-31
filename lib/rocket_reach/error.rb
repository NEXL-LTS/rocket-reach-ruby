# frozen_string_literal: true

module RocketReach
  class Error < StandardError
    attr_reader :response

    def initialize(err)
      @response = err.response if err.respond_to?(:response)
      super(err)
    end

    def self.wrap(error)
      new(error)
    end
  end
end
