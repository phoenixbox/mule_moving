require "rails_helper"

describe MoverListItemSerializer do
  describe "#as_json" do
    it "returns json representation of item" do
      mover_list_item = MoverListItem.new.tap do |item|
        item.id = 9
        item.name = "Taylor Moving"
        item.description = "Some description"
        item.hero_img = "http://some-img.com"
        item.yelp_stars = 3.5
        item.yelp_url = "http://yelp-url.com"
        item.yelp_review_count = 12
        item.employees = 9
        item.year_started = 1994
        item.general_liability_insurance = true
        item.avg_price_per_hour = 2
      end

      serializer = MoverListItemSerializer.new(mover_list_item)

      expect(serializer.as_json).to eq({
                                         id: 9,
                                         name: "Taylor Moving",
                                         description: "Some description",
                                         hero_img: "http://some-img.com",
                                         yelp_stars: 3.5,
                                         yelp_url: "http://yelp-url.com",
                                         yelp_review_count: 12,
                                         employees: 9,
                                         general_liability_insurance: true,
                                         avg_price_per_hour: 2,
                                         years_in_business: 20,
                                         path: Rails.application.routes.url_helpers.mover_path(9)
                                       })
    end
  end
end