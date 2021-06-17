RSpec.describe RocketReach::Client do
  subject do
    VCR.use_cassette("rocket_reach_susan") do
      described_class.fetch(
        name: "Susan Clayton",
        current_title: "Marketing Manager",
        location: "United Kingdom",
        current_employer: "eversheds-sutherland.com"
      )
    end
  end

  before{
    RocketReach.configuration.api_key = 'api_key'
  }

  it("has profile") {
    expect(subject).to include({
                                 "profiles" => [
                                   {
                                     "city" => "Sandwell",
                                     "country_code" => "UK",
                                     "current_employer" => "Eversheds Sutherland",
                                     "current_title" => "Digital Project Manager",
                                     "id" => 34_276_497,
                                     "linkedin_url" => "https://www.linkedin.com/in/susanjclayton",
                                     "links" => nil,
                                     "location" => "Sandwell, Sandwell, United Kingdom",
                                     "name" => "Susan Clayton",
                                     "profile_pic" => "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSMsprHI3q3WadMm5DxPoHeFviZ8CfFNLj7RjdRuWKoHDYD3UW4tpdgLxI",
                                     "region" => nil,
                                     "status" => "complete",
                                     "teaser" => { "emails" => ["dlapiper.com", "dune45digital.com"],
                                                   "is_premium_phone_available" => false,
                                                   "office_phones" => [],
                                                   "phones" => [], "preview" => [] }
                                   }
                                 ]
                               })
  }

  it("has pagination") {
    expect(subject).to include({ "pagination" => { "next" => 2, "start" => 1, "total" => 1 } })
  }
end
