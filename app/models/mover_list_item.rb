class MoverListItem
  attr_accessor :id,
                :name,
                :description,
                :rating,
                :avg_price_per_hour,
                :general_liability_insurance,
                :years_in_business,
                :employees

  def initialize(mover = nil)
    @id = mover.try(:id)
    @name = mover.try(:name)
    @description = mover.try(:description)
  end

  def yelp?
    !!rating
  end
end