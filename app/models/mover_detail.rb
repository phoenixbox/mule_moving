class MoverDetail
  attr_accessor :id,
                :name,
                :description,
                :address,
                :automobile_insurance,
                :cargo_insurance,
                :general_liability_insurance,
                :workers_compensation,
                :hero_img,
                :company_registration,
                :puc,
                :state_dot,
                :us_dot,
                :hours_mon,
                :hours_tue,
                :hours_wed,
                :hours_thu,
                :hours_fri,
                :hours_sat,
                :hours_sun,
                :employees,
                :trucks,
                :yelp_stars,
                :yelp_review_count,
                :yelp_review_snippet,
                :yelp_url,
                :yelp_stars_img_url,
                :avg_price_per_hour,
                :employees,
                :appliances_install,
                :appliances_uninstall,
                :auto_transport,
                :bulky_items,
                :cleaning,
                :crating,
                :electronics_packaging,
                :extra_stops,
                :furniture_assembly,
                :furniture_disassembly,
                :furniture_wrapping,
                :gun_safe,
                :packaging,
                :personal_truck_loading,
                :pianos,
                :shuttling,
                :storage

  attr_writer :year_started

  def initialize(mover = nil)
    @id = mover.try(:id)
    @name = mover.try(:name)
    @description = mover.try(:description)
  end

  def years_in_business
    return nil unless @year_started

    Time.zone.now.year - @year_started
  end

  def yelp?
    !!yelp_stars
  end
end