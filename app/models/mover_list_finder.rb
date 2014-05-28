class MoverListFinder
  def for_location(_)
    movers = MoverFinder.new.all
    movers.map do |mover|
      MoverListItem.new.tap do |mover_list_item|
        mover_list_item.name = mover.name
        mover_list_item.description = mover.description
      end
    end
  end
end