# frozen_string_literal: true

RSpec.describe RocketReach::Client do
  let(:response) do
    VCR.use_cassette("rocket_reach_susan") do
      described_class.search(
        query: {
          name: "Susan Clayton",
          current_title: "Marketing Manager",
          location: "United Kingdom",
          current_employer: "eversheds-sutherland.com"
        }
      )
    end
  end

  before do
    RocketReach.configuration.api_key = "api_key"
  end

  it("has profile") {
    expect(response["profiles"]).not_to be_nil
    expect(response["profiles"]).not_to be_empty
  }

  it("has pagination") {
    expect(response).to include({ "pagination" => { "next" => 2, "start" => 1, "total" => 1 } })
  }

  describe "profile has fields" do
    let(:profile) { response["profiles"].first }

    it("has status") {
      expect(profile["status"]).to eq("complete")
    }

    it("has current_employer") {
      expect(profile["current_employer"]).to eq("Eversheds Sutherland")
    }

    it("has current_title") {
      expect(profile["current_title"]).to eq("Digital Project Manager")
    }

    it("has location") {
      expect(profile["location"]).to eq("Sandwell, Sandwell, United Kingdom")
    }

    it("has linkedin_url") {
      expect(profile["linkedin_url"]).to eq("https://www.linkedin.com/in/susanjclayton")
    }

    it("has profile_pic") {
      expect(profile["profile_pic"]).to eq("https://encrypted-tbn3.gstatic.com/images?\
q=tbn:ANd9GcSMsprHI3q3WadMm5DxPoHeFviZ8CfFNLj7RjdRuWKoHDYD3UW4tpdgLxI")
    }
  end
end
