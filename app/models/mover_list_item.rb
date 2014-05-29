class MoverListItem
  attr_accessor :id,
                :name,
                :description,
                :rating,
                :avg_price_per_hour,
                :general_liability_insurance,
                :years_in_business,
                :employees

  def yelp?
    !!rating
  end
end