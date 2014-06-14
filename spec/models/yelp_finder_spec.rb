require "rails_helper"

describe YelpFinder do
  let(:client) { double("client") }

  subject { YelpFinder.new(client) }

  describe "#find_business" do
    it "returns a yelp business" do
      remote_business = double(
        "remote business",
        rating: 2.5,
        review_count: 12,
        url: "www.yelp.com/your-mover",
        mobile_url: "m.yelp.com/your-mover",
        rating_img_url: "www.example.com/image/1",
        rating_img_url_small: "www.example.com/image/1/small",
        snippet_text: "These guys were..."
      )

      allow(client).to receive(:business).with("yelp-san-francisco").and_return(remote_business)

      business = subject.find_business("yelp-san-francisco")

      expect(business).to be_a YelpBusiness
      expect(business.stars).to eq 2.5
      expect(business.review_count).to eq 12
      expect(business.review_snippet).to eq "These guys were..."
      expect(business.url).to eq "www.yelp.com/your-mover"
      expect(business.stars_img_url).to eq "www.example.com/image/1"
      expect(business.stars_img_url_small).to eq "www.example.com/image/1/small"
    end

    it "returns nil if not found (two cases)" do
      allow(client).to receive(:business).with("unknown-business-id").and_raise(JSON::ParserError)

      expect(subject.find_business("unknown-business-id")).to eq nil

      allow(client).to receive(:business).with("unknown-business-id").and_raise(Yelp::Error::BusinessUnavailable)

      expect(subject.find_business("unknown-business-id")).to eq nil
    end
  end
end