class MoverListItem
  attr_accessor :id,
                :name,
                :description,
                :rating,
                :review_count,
                :review

  def yelp?
    !!rating
  end
end