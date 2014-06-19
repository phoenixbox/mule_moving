class MoverListItemSerializer
  def initialize(mover_list_item)
    @mover_list_item = mover_list_item
  end

  def as_json(opts = {})
    {
      id: @mover_list_item.id,
      name: @mover_list_item.name,
      description: @mover_list_item.description,
      hero_img: @mover_list_item.hero_img,
      yelp_stars: @mover_list_item.yelp_stars,
      yelp_url: @mover_list_item.yelp_url,
      yelp_review_count: @mover_list_item.yelp_review_count,
      employees: @mover_list_item.employees,
      automobile_insurance: @mover_list_item.automobile_insurance,
      cargo_insurance: @mover_list_item.cargo_insurance,
      general_liability_insurance: @mover_list_item.general_liability_insurance,
      workers_compensation: @mover_list_item.workers_compensation,
      avg_price_per_hour: @mover_list_item.avg_price_per_hour,
      appliances_install: @mover_list_item.appliances_install,
      appliances_uninstall: @mover_list_item.appliances_uninstall,
      auto_transport: @mover_list_item.auto_transport,
      bulky_items: @mover_list_item.bulky_items,
      cleaning: @mover_list_item.cleaning,
      crating: @mover_list_item.crating,
      electronics_packaging: @mover_list_item.electronics_packaging,
      extra_stops: @mover_list_item.extra_stops,
      furniture_assembly: @mover_list_item.furniture_assembly,
      furniture_disassembly: @mover_list_item.furniture_disassembly,
      furniture_wrapping: @mover_list_item.furniture_wrapping,
      gun_safe: @mover_list_item.gun_safe,
      packaging: @mover_list_item.packaging,
      personal_truck_loading: @mover_list_item.personal_truck_loading,
      pianos: @mover_list_item.pianos,
      shuttling: @mover_list_item.shuttling,
      storage: @mover_list_item.storage,
      years_in_business: years_in_business,
      path: path,
      booking_path: booking_path
    }
  end

  private

  def years_in_business
    return nil unless @mover_list_item.year_started

    Time.zone.now.year - @mover_list_item.year_started
  end

  def path
    Rails.application.routes.url_helpers.mover_path(@mover_list_item.id)
  end

  def booking_path
    Rails.application.routes.url_helpers.booking_path(@mover_list_item.id)
  end
end











