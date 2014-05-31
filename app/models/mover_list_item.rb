class MoverListItem
  attr_accessor :id,
                :name,
                :description,
                :yelp_stars,
                :avg_price_per_hour,
                :general_liability_insurance,
                :year_started,
                :employees

  def initialize(mover = nil)
    @id = mover.try(:id)
    @name = mover.try(:name)
    @description = mover.try(:description)
  end

  def yelp?
    !!yelp_stars
  end
end