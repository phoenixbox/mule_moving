require 'spec_helper'

describe MoverAssociationsHydrator do
  let(:hydratee_class) {
    Class.new do
      def id
        12
      end
    end
  }

  describe '#yelp' do
    let(:hydratee) {
     Class.new(hydratee_class) do
        attr_accessor :rating
      end.new
    }

    it 'assigns the yelp properties' do
      MoverYelpRecord.create(mover_id: 12, yelp_id: 'abc-123')
      yelp_business = double('yelp business', rating: 2.5)
      expect_any_instance_of(YelpFinder).to receive(:find_business).with('abc-123').and_return(yelp_business)

      subject.yelp(hydratee)

      expect(hydratee.rating).to eq 2.5
    end

    it 'does not assign properties if no association exists' do
      expect {
        subject.yelp(hydratee)
      }.to_not raise_exception
    end
  end

  describe '#pricing' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :avg_price_per_hour
      end.new
    }

    it 'assigns pricing details' do
      MoverPricingRecord.create(mover_id: 12, avg_price_per_hour: 19)

      subject.pricing(hydratee)

      expect(hydratee.avg_price_per_hour).to eq 19
    end

    it 'handles no pricing' do
      expect {
        subject.pricing(hydratee)
      }.to_not raise_exception
    end
  end

  describe 'compliance' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :general_liability_insurance
      end.new
    }

    it 'assigns compliance details' do
      MoverComplianceRecord.create(mover_id: 12, general_liability_insurance: "Super Duper Ins.")

      subject.compliance(hydratee)

      expect(hydratee.general_liability_insurance).to eq("Super Duper Ins.")
    end

    it 'handles no compliance' do
      expect {
        subject.compliance(hydratee)
      }.to_not raise_exception
    end
  end

  describe '#statistics' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :employees, :years_in_business
      end.new
    }

    it 'assigns statistics' do
      MoverStatisticsRecord.create(mover_id: 12, employees: 2, years_in_business: 2)

      subject.statistics(hydratee)

      expect(hydratee.employees).to eq 2
      expect(hydratee.years_in_business).to eq 2
    end

    it 'handles no statistics' do
      expect {
        subject.statistics(hydratee)
      }.to_not raise_exception
    end
  end
end
