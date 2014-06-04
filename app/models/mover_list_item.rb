class MoverListItem
  attr_accessor :id,
                :name,
                :description,
                :hero_img,
                :yelp_stars,
                :yelp_url,
                :yelp_review_count,
                :avg_price_per_hour,
                :general_liability_insurance,
                :employees

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