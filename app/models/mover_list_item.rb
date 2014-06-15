class MoverListItem
  attr_accessor :id,
                :name,
                :description,
                :hero_img,
                :yelp_stars,
                :yelp_url,
                :yelp_review_count,
                :employees,
                :year_started,
                :general_liability_insurance,
                :avg_price_per_hour,
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

  def initialize(mover = nil)
    @id = mover.try(:id)
    @name = mover.try(:name)
    @description = mover.try(:description)
  end
end