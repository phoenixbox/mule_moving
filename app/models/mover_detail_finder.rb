class MoverDetailFinder
  def for_id(mover_id)
    mover = MoverFinder.new.find_by_id(mover_id)
    mover_detail = MoverDetail.new(mover)

    associations_hydrator = MoverAssociationsHydrator.new
    associations_hydrator.yelp(mover_detail)
    associations_hydrator.pricing(mover_detail)
    associations_hydrator.compliance(mover_detail)
    associations_hydrator.statistics(mover_detail)
    associations_hydrator.address(mover_detail)
    associations_hydrator.hero(mover_detail)
    associations_hydrator.licenses(mover_detail)
    associations_hydrator.services(mover_detail)
    associations_hydrator.hours(mover_detail)

    mover_detail
  end
end