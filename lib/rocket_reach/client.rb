# frozen_string_literal: true

module RocketReach
  class Client
    class << self
      def search(query: {}, start: 1, page_size: 10, order_by: "popularity")
        response = Faraday.post(search_url) do |req|
          req.headers["Content-Type"] = "application/json"
          req.headers["Api-Key"] = api_key
          req.body = { query: query.transform_values { |e| Array.wrap(e) },
                       order_by: order_by, start: start, page_size: page_size }.to_json
        end
        MultiJson.load(response.body)
      rescue Faraday::Error => e
        Error.new(e)
      end

      def lookup_profile(request = {})
        response = Faraday.get(lookup_profile_url) do |req|
          req.headers["Content-Type"] = "application/json"
          req.headers["Api-Key"] = api_key
          req.params = request
        end
        MultiJson.load(response.body)
      rescue Faraday::Error => e
        Error.new(e)
      end

      private

      def api_key
        RocketReach.configuration.api_key
      end

      def search_url
        "https://api.rocketreach.co/v2/api/search"
      end

      def lookup_profile_url
        "https://api.rocketreach.co/v2/api/lookupProfile"
      end
    end
  end
end
