seed_data = YAML.load_file('db/seeds.yml')

seed_data['movers'].each do |mover|
  id = MoverRecord.create!(name: mover['name'], description: mover['description']).id
  base = { mover_id: id }
  MoverAddressRecord.create!(base.merge(mover['address']))
  MoverComplianceRecord.create!(base.merge(mover['compliance']))
  MoverYelpRecord.create!(base.merge(yelp_id: mover['external_ids']['yelp_id'])) if mover['external_ids']['yelp_id']
  MoverHeroRecord.create!(base.merge(image_url: mover['images']['hero']['url']))
  MoverLicensesRecord.create!(base.merge(mover['licenses']))
  MoverStatisticsRecord.create!(base.merge(mover['statistics']))
  MoverServicesRecord.create!(base.merge(mover['services']))
  MoverPricingRecord.create!(base.merge(avg_price_per_hour: mover['pricing']))

  hours = mover['operating_hours']
  hours.each do |hour|
    day_of_week = case hour.first
                    when 'mon'
                      1
                    when 'tue'
                      2
                    when 'wed'
                      3
                    when 'thu'
                      4
                    when 'fri'
                      5
                    when 'sat'
                      6
                    when 'sun'
                      7
                    else
                      raise 'Unrecognized day of week'
                  end
    blah = hour.second
    MoverOpeningHourRecord.create!(base.merge(day_of_week: day_of_week, open: blah['open'], close: blah['close']))
  end
end