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
        item.automobile_insurance = true
        item.cargo_insurance = false
        item.general_liability_insurance = true
        item.workers_compensation = false
        item.avg_price_per_hour = 2
        item.appliances_install = true
        item.appliances_uninstall = true
        item.auto_transport = true
        item.bulky_items = true
        item.cleaning = true
        item.crating = true
        item.electronics_packaging = true
        item.extra_stops = false
        item.furniture_assembly = true
        item.furniture_disassembly = true
        item.furniture_wrapping = true
        item.gun_safe = true
        item.packaging = true
        item.personal_truck_loading = true
        item.pianos = true
        item.shuttling = true
        item.storage = false
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
                                         automobile_insurance: true,
                                         cargo_insurance: false,
                                         general_liability_insurance: true,
                                         workers_compensation: false,
                                         avg_price_per_hour: 2,
                                         years_in_business: 20,
                                         path: Rails.application.routes.url_helpers.mover_path(9),
                                         booking_path: Rails.application.routes.url_helpers.booking_path(9),
                                         appliances_install: true,
                                         appliances_uninstall: true,
                                         auto_transport: true,
                                         bulky_items: true,
                                         cleaning: true,
                                         crating: true,
                                         electronics_packaging: true,
                                         extra_stops: false,
                                         furniture_assembly: true,
                                         furniture_disassembly: true,
                                         furniture_wrapping: true,
                                         gun_safe: true,
                                         packaging: true,
                                         personal_truck_loading: true,
                                         pianos: true,
                                         shuttling: true,
                                         storage: false
                                       })
    end
  end
end