class MoverListFinder
  def for_location(_)
    movers = MoverFinder.new.all

    movers.map do |mover|
      mover_yelp = MoverYelpRecord.find_by(mover_id: mover.id)
      business = nil

      if mover_yelp
        mover.yelp_id = mover_yelp.yelp_id
        business = YelpFinder.new.find_business(mover.yelp_id)
      end

      pricing = MoverPricingRecord.find_by(mover_id: mover.id)
      compliance = MoverComplianceRecord.find_by(mover_id: mover.id)
      statistics = MoverStatisticsRecord.find_by(mover_id: mover.id)

      MoverListItemBuilder.new.build(mover, business, pricing, compliance, statistics)
    end
  end
end