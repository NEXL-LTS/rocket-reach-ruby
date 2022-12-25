# frozen_string_literal: true

module RocketReach
  class Client
    class << self
      def search(query: {}, start: 1, page_size: 10, order_by: "popularity")
        response = connection.post("/v2/api/search") do |req|
          req.headers["Content-Type"] = "application/json"
          req.headers["Api-Key"] = api_key
          req.body = { query: query.transform_values { |e| Array.wrap(e) },
                       order_by: order_by, start: start, page_size: page_size }.to_json
        end
        MultiJson.load(response.body)
      rescue Faraday::Error => e
        raise RocketReach.wrap_error(e)
      end

      def lookup_profile(request = {})
        response = connection.get("/v2/api/lookupProfile") do |req|
          req.headers["Content-Type"] = "application/json"
          req.headers["Api-Key"] = api_key
          req.params = request
        end
        MultiJson.load(response.body)
      rescue Faraday::Error => e
        raise RocketReach.wrap_error(e)
      end

      private

      def api_key
        configuration.api_key
      end

      def connection
        configuration.connection
      end

      def configuration
        RocketReach.configuration
      end
    end
  end
end
