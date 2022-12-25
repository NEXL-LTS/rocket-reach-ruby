# frozen_string_literal: true

RSpec.describe RocketReach::Client do
  before do
    RocketReach.configuration.api_key = "api_key"
  end

  describe "search with prospect id" do
    let(:response) do
      VCR.use_cassette("rocket_reach_lookup") do
        described_class.lookup_profile(id: "5442")
      end
    end

    it("has name") {
      expect(response["name"]).to eq("Kristine Schachinger")
    }

    it("has emails") {
      expect(response["emails"].map { |email| email["email"] }).to match_array(
        ["kschachinger@travelworm.com", "kristine@siteswithoutwalls.com", "schachin@yahoo.com",
         "schachin@gmail.com", "kristine.marketing@thevettersmovie.com", "marketing@thevettersmovie.com",
         "kristine@thevettersmovie.com",
         "kristinemarketing@thevettersmovie.com", "kmarketing@thevettersmovie.com", "kschachinger@jetaway.com",
         "kristinem@thevettersmovie.com", "sociograd@nscee.edu", "kristine_marketing@thevettersmovie.com",
         "marketingk@thevettersmovie.com"]
      )
    }

    it("has status") {
      expect(response["status"]).to eq("progress")
    }

    it("has profile_pic") {
      expect(response["profile_pic"]).to eq("https://encrypted-tbn0.gstatic.com/images?\
q=tbn:ANd9GcTCPIO85TL6KX2_kmnOHnBUe3m2zNQgnh9AgWvDH_zU1GW-N1xSm1uU2sow")
    }

    it("has linkedin_url") {
      expect(response["linkedin_url"]).to eq("https://www.linkedin.com/in/kschachinger")
    }

    it("has current_employer") {
      expect(response["current_employer"])
        .to eq("Sites Without Walls Website Seo & Online Digital Marketing Consulting")
    }

    it("has current_title") {
      expect(response["current_title"]).to eq("Chief Executive Officer \
| Founder Sites Without Walls - Concierge Seo, Site Audits, and Digital Marketing Strategies")
    }
  end

  describe "search with linkedin url" do
    let(:response) do
      VCR.use_cassette("rocket_reach_lookup_linkedin") do
        described_class.lookup_profile(li_url: "https://www.linkedin.com/in/kschachinger")
      end
    end

    it("has name") {
      expect(response["name"]).to eq("Kristine Schachinger")
    }

    it("has current_employer") {
      expect(response["current_employer"])
        .to eq("Sites Without Walls Website Seo & Online Digital Marketing Consulting")
    }
  end
end
