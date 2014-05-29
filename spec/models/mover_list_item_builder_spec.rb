require 'spec_helper'

describe MoverListItemBuilder do
  describe '#build' do
    it 'merges the entity and business' do
      mover = MoverEntity.new
      mover.id = 9
      mover.name = 'Taylor Moving'
      mover.description = 'Boulder\'s original mover'

      compliance = MoverComplianceRecord.new
      compliance.general_liability_insurance = 'http://ss3.com/general_insurance_liab_9'

      pricing = MoverPricingRecord.new
      pricing.avg_price_per_hour = 45

      statistics = MoverStatisticsRecord.new
      statistics.years_in_business = 10
      statistics.employees = 8

      business = YelpBusiness.new
      business.rating = 5

      list_item = MoverListItemBuilder.new.build(mover, business, pricing, compliance, statistics)

      expect(list_item.id).to eq 9
      expect(list_item.name).to eq 'Taylor Moving'
      expect(list_item.description).to eq 'Boulder\'s original mover'
      expect(list_item.rating).to eq 5
      expect(list_item.years_in_business).to eq 10
      expect(list_item.avg_price_per_hour).to eq 45
      expect(list_item.employees).to eq 8
      expect(list_item.general_liability_insurance).to eq 'http://ss3.com/general_insurance_liab_9'
    end

    it 'handles associations as nil' do
      mover = MoverEntity.new

      expect {
        MoverListItemBuilder.new.build(mover, nil, nil, nil, nil)
      }.to_not raise_exception
    end
  end
end