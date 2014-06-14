class MoverAssociationsHydrator
  def yelp(hydratee)
    mover_yelp_record = MoverYelpRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_yelp_record

    yelp_business = YelpFinder.new.find_business(mover_yelp_record.yelp_id)
    return nil unless yelp_business

    hydratee.try(:yelp_stars=, yelp_business.stars)
    hydratee.try(:yelp_review_count=, yelp_business.review_count)
    hydratee.try(:yelp_review_snippet=, yelp_business.review_snippet)
    hydratee.try(:yelp_url=, yelp_business.url)
    hydratee.try(:yelp_stars_img_url=, yelp_business.stars_img_url)
  end

  def pricing(hydratee)
    mover_pricing_record = MoverPricingRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_pricing_record

    hydratee.try(:avg_price_per_hour=, mover_pricing_record.avg_price_per_hour)
  end

  def compliance(hydratee)
    mover_compliance_record = MoverComplianceRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_compliance_record

    hydratee.try(:automobile_insurance=, mover_compliance_record.automobile_insurance)
    hydratee.try(:cargo_insurance=, mover_compliance_record.cargo_insurance)
    hydratee.try(:general_liability_insurance=, mover_compliance_record.general_liability_insurance)
    hydratee.try(:workers_compensation=, mover_compliance_record.workers_compensation)
  end

  def statistics(hydratee)
    mover_statistics_record = MoverStatisticsRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_statistics_record

    hydratee.try(:year_started=, mover_statistics_record.year_started)
    hydratee.try(:employees=, mover_statistics_record.employees)
    hydratee.try(:trucks=, mover_statistics_record.trucks)
  end

  def address(hydratee)
    mover_address_record = MoverAddressRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_address_record

    hydratee.try(:address=, [
      mover_address_record.line1,
      mover_address_record.line2,
      mover_address_record.city,
      mover_address_record.state,
      mover_address_record.zip
    ].compact.join(", "))
  end

  def hero(hydratee)
    mover_hero_record = MoverHeroRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_hero_record

    hydratee.try(:hero_img=, mover_hero_record.image_url)
  end

  def services(hydratee)
    mover_services_record = MoverServicesRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_services_record

    hydratee.try(:appliances_install=, mover_services_record.appliances_install)
    hydratee.try(:appliances_uninstall=, mover_services_record.appliances_uninstall)
    hydratee.try(:auto_transport=, mover_services_record.auto_transport)
    hydratee.try(:bulky_items=, mover_services_record.bulky_items)
    hydratee.try(:cleaning=, mover_services_record.cleaning)
    hydratee.try(:crating=, mover_services_record.crating)
    hydratee.try(:electronics_packaging=, mover_services_record.electronics_packaging)
    hydratee.try(:extra_stops=, mover_services_record.extra_stops)
    hydratee.try(:furniture_assembly=, mover_services_record.furniture_assembly)
    hydratee.try(:furniture_disassembly=, mover_services_record.furniture_disassembly)
    hydratee.try(:furniture_wrapping=, mover_services_record.furniture_wrapping)
    hydratee.try(:gun_safe=, mover_services_record.gun_safe)
    hydratee.try(:packaging=, mover_services_record.packaging)
    hydratee.try(:personal_truck_loading=, mover_services_record.personal_truck_loading)
    hydratee.try(:pianos=, mover_services_record.pianos)
    hydratee.try(:shuttling=, mover_services_record.shuttling)
    hydratee.try(:storage=, mover_services_record.storage)
  end

  def licenses(hydratee)
    mover_licenses_record = MoverLicensesRecord.find_by(mover_id: hydratee.id)
    return nil unless mover_licenses_record

    hydratee.try(:company_registration=, mover_licenses_record.company_registration)
    hydratee.try(:puc=, mover_licenses_record.puc)
    hydratee.try(:state_dot=, mover_licenses_record.state_dot)
    hydratee.try(:us_dot=, mover_licenses_record.us_dot)
  end

  def hours(hydratee)
    mover_opening_hours_records = MoverOpeningHourRecord.where(mover_id: hydratee.id)

    date_format = "%H:%M"
    mover_opening_hours_records.each do |opening_hour_record|
      hydratee.try(:hours_mon=, "#{opening_hour_record.open.strftime(date_format)} - #{opening_hour_record.close.strftime(date_format)}") if opening_hour_record.day_of_week == 1
      hydratee.try(:hours_tue=, "#{opening_hour_record.open.strftime(date_format)} - #{opening_hour_record.close.strftime(date_format)}") if opening_hour_record.day_of_week == 2
      hydratee.try(:hours_wed=, "#{opening_hour_record.open.strftime(date_format)} - #{opening_hour_record.close.strftime(date_format)}") if opening_hour_record.day_of_week == 3
      hydratee.try(:hours_thu=, "#{opening_hour_record.open.strftime(date_format)} - #{opening_hour_record.close.strftime(date_format)}") if opening_hour_record.day_of_week == 4
      hydratee.try(:hours_fri=, "#{opening_hour_record.open.strftime(date_format)} - #{opening_hour_record.close.strftime(date_format)}") if opening_hour_record.day_of_week == 5
      hydratee.try(:hours_sat=, "#{opening_hour_record.open.strftime(date_format)} - #{opening_hour_record.close.strftime(date_format)}") if opening_hour_record.day_of_week == 6
      hydratee.try(:hours_sun=, "#{opening_hour_record.open.strftime(date_format)} - #{opening_hour_record.close.strftime(date_format)}") if opening_hour_record.day_of_week == 7
    end
  end
end