class MoverListFinder
  def for_location(_)
    movers = MoverFinder.new.all
    mover_items = movers.map { |mover| MoverListItem.new(mover) }

    hydrator = MoverAssociationsHydrator.new
    mover_items.map do |mover_item|
      hydrator.yelp(mover_item)
      hydrator.compliance(mover_item)
      hydrator.pricing(mover_item)
      hydrator.statistics(mover_item)
    end

    mover_items
  end
end
