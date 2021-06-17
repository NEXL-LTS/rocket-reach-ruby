module RocketReach
  class Client
    class << self
      def fetch(name: nil, current_title: nil, location: nil, current_employer: nil, order_by: "popularity")
        response = Faraday.post(url) do |req|
          req.headers["Content-Type"] = "application/json"
          req.headers["Api-Key"] = api_key
          req.body = {
            query: {
              name: Array.wrap(name),
              location: Array.wrap(location),
              current_title: Array.wrap(current_title),
              current_employer: Array.wrap(current_employer)
            },
            order_by: order_by
          }.to_json
        end
        MultiJson.load(response.body)
      rescue Faraday::Error => e
        Error.new(e)
      end

      def api_key
        RocketReach.configuration.api_key
      end

      def url
        "https://api.rocketreach.co/v2/api/search"
      end
    end
  end
end
