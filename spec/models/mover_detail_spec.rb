require "rails_helper"

describe MoverDetail do
  describe "#yelp?" do
    it "returns true when rating present" do
      subject.yelp_stars = 5

      expect(subject.yelp?).to eq true
    end

    it "returns false when rating absent" do
      expect(subject.yelp?).to eq false
    end
  end

  describe "#years_in_business" do
    it "returns years between started and now" do
      twenty_ten = Date.parse("01/01/2010")

      travel_to(twenty_ten) do
        subject.year_started = 2004

        expect(subject.years_in_business).to eq 6
      end
    end

    it "returns nil if unknown" do
      expect(subject.years_in_business).to eq nil
    end
  end
end