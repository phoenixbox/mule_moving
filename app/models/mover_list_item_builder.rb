class MoverListItemBuilder
  def build(mover, business)
    MoverListItem.new.tap do |mover_list_item|
      mover_list_item.id = mover.id
      mover_list_item.name = mover.name
      mover_list_item.description = mover.description

      if business
        mover_list_item.rating = business.rating
        mover_list_item.review_count = business.review_count
        mover_list_item.review = business.snippet_text
      end
    end
  end
end