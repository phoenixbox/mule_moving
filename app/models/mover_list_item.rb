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
                :avg_price_per_hour

  def initialize(mover = nil)
    @id = mover.try(:id)
    @name = mover.try(:name)
    @description = mover.try(:description)
  end
end