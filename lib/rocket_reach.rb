# frozen_string_literal: true

require "faraday"
require "json"
require "active_support/core_ext/array"
require "multi_json"
require_relative "rocket_reach/client"
require_relative "rocket_reach/configuration"
require_relative "rocket_reach/version"

module RocketReach
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
