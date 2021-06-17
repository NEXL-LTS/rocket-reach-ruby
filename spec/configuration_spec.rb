# frozen_string_literal: true

RSpec.describe RocketReach::Configuration do
  let(:api_key) { "api_key" }
  before do
    RocketReach.configure do |config|
      config.api_key = api_key
    end
  end

  it("has api key") {
    expect(RocketReach.configuration.api_key).to eq(api_key)
  }
end
