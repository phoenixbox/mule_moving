class MoverAssociationsHydrator
  def yelp(hydratee)
    mover_yelp_record = MoverYelpRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_yelp_record

    yelp_business = YelpFinder.new.find_business(mover_yelp_record.yelp_id)

    hydratee.rating = yelp_business.rating
  end

  def pricing(hydratee)
    mover_pricing_record = MoverPricingRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_pricing_record

    hydratee.avg_price_per_hour = mover_pricing_record.avg_price_per_hour
  end

  def compliance(hydratee)
    mover_compliance_record = MoverComplianceRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_compliance_record

    hydratee.general_liability_insurance = mover_compliance_record.general_liability_insurance
  end

  def statistics(hydratee)
    mover_statistics_record = MoverStatisticsRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_statistics_record

    hydratee.employees = mover_statistics_record.employees
    hydratee.years_in_business = mover_statistics_record.years_in_business
  end
end