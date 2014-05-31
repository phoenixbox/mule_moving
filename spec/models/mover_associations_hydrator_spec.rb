require 'spec_helper'

describe MoverAssociationsHydrator do
  let(:hydratee_class) {
    Class.new do
      def id
        12
      end
    end
  }

  describe 'partially conforming presenters' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :yelp_stars
      end.new
    }

    it 'only hydrated with setter attributes they allow' do
      create_mover_yelp(mover_id: 12, yelp_id: 'abc-123')
      yelp_business = YelpBusiness.new
      yelp_business.stars = 2.5
      yelp_business.review_count = 90

      expect_any_instance_of(YelpFinder).to receive(:find_business).with('abc-123').and_return(yelp_business)

      subject.yelp(hydratee)

      expect(hydratee.yelp_stars).to eq 2.5
      expect(hydratee).to_not respond_to :yelp_review_count
    end
  end

  describe '#yelp' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :yelp_stars, :yelp_review_count, :yelp_review_snippet, :yelp_url, :yelp_stars_img_url
      end.new
    }

    it 'assigns the yelp properties' do
      create_mover_yelp(mover_id: 12, yelp_id: 'abc-123')
      yelp_business = YelpBusiness.new
      yelp_business.stars = 2.5
      yelp_business.review_count = 90
      yelp_business.review_snippet = 'These movers were amazing..'
      yelp_business.url = 'www.example.com/yelp-url'
      yelp_business.stars_img_url = 'www.example.com/yelp-img'

      expect_any_instance_of(YelpFinder).to receive(:find_business).with('abc-123').and_return(yelp_business)

      subject.yelp(hydratee)

      expect(hydratee.yelp_stars).to eq 2.5
      expect(hydratee.yelp_review_count).to eq 90
      expect(hydratee.yelp_review_snippet).to eq 'These movers were amazing..'
      expect(hydratee.yelp_url).to eq 'www.example.com/yelp-url'
      expect(hydratee.yelp_stars_img_url).to eq 'www.example.com/yelp-img'
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
      create_mover_pricing(mover_id: 12, avg_price_per_hour: 19)

      subject.pricing(hydratee)

      expect(hydratee.avg_price_per_hour).to eq 19
    end

    it 'handles not found' do
      expect {
        subject.pricing(hydratee)
      }.to_not raise_exception
    end
  end

  describe 'compliance' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :automobile_insurance,
                      :cargo_insurance,
                      :general_liability_insurance,
                      :workers_compensation

      end.new
    }

    it 'assigns compliance details' do
      create_mover_compliance(mover_id: 12,
                              automobile_insurance: 'Super Duper Ins. 1',
                              cargo_insurance: 'Super Duper Ins. 2',
                              general_liability_insurance: 'Super Duper Ins. 3',
                              workers_compensation: 'Super Duper Ins. 4'
      )

      subject.compliance(hydratee)

      expect(hydratee.automobile_insurance).to eq 'Super Duper Ins. 1'
      expect(hydratee.cargo_insurance).to eq 'Super Duper Ins. 2'
      expect(hydratee.general_liability_insurance).to eq 'Super Duper Ins. 3'
      expect(hydratee.workers_compensation).to eq 'Super Duper Ins. 4'
    end

    it 'handles not found' do
      expect {
        subject.compliance(hydratee)
      }.to_not raise_exception
    end
  end

  describe '#statistics' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :year_started,
                      :employees,
                      :trucks
      end.new
    }

    it 'assigns statistics' do
      create_mover_statistics(mover_id: 12, employees: 2, trucks: 9, year_started: 2012)

      subject.statistics(hydratee)

      expect(hydratee.year_started).to eq 2012
      expect(hydratee.employees).to eq 2
      expect(hydratee.trucks).to eq 9
    end

    it 'handles not found' do
      expect {
        subject.statistics(hydratee)
      }.to_not raise_exception
    end
  end

  describe '#address' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :address
      end.new
    }

    it 'assigns address' do
      create_mover_address(
        mover_id: 12,
        line1: '123 Central Place',
        line2: 'Apt 5',
        city: 'Boulder',
        state: 'CO',
        zip: '01234'
      )

      subject.address(hydratee)

      expect(hydratee.address).to eq '123 Central Place, Apt 5, Boulder, CO, 01234'
    end

    it 'handles not found' do
      expect {
        subject.address(hydratee)
      }.to_not raise_exception
    end
  end

  describe '#hero' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :hero_img
      end.new
    }

    it 'assigns hero' do
      create_mover_hero(
        mover_id: 12,
        image_url: 'www.example.com/hero-img'
      )

      subject.hero(hydratee)

      expect(hydratee.hero_img).to eq 'www.example.com/hero-img'
    end

    it 'handles not found' do
      expect {
        subject.hero(hydratee)
      }.to_not raise_exception
    end
  end

  describe '#services' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :appliances_install,
                      :appliances_uninstall,
                      :auto_transport,
                      :bulky_items,
                      :cleaning,
                      :crating,
                      :electronics_packaging,
                      :extra_stops,
                      :furniture_assembly,
                      :furniture_disassembly,
                      :furniture_wrapping,
                      :gun_safe,
                      :packaging,
                      :personal_truck_loading,
                      :pianos,
                      :shuttling,
                      :storage
      end.new
    }

    it 'assigns services' do
      create_mover_services(
        mover_id: 12,
        appliances_install: true,
        appliances_uninstall: true,
        auto_transport: true,
        bulky_items: true,
        cleaning: true,
        crating: true,
        electronics_packaging: true,
        extra_stops: false,
        furniture_assembly: true,
        furniture_disassembly: true,
        furniture_wrapping: true,
        gun_safe: true,
        packaging: true,
        personal_truck_loading: true,
        pianos: true,
        shuttling: true,
        storage: true
      )

      subject.services(hydratee)

      expect(hydratee.appliances_install).to eq true
      expect(hydratee.appliances_uninstall).to eq true
      expect(hydratee.auto_transport).to eq true
      expect(hydratee.bulky_items).to eq true
      expect(hydratee.cleaning).to eq true
      expect(hydratee.crating).to eq true
      expect(hydratee.electronics_packaging).to eq true
      expect(hydratee.extra_stops).to eq false
      expect(hydratee.furniture_assembly).to eq true
      expect(hydratee.furniture_disassembly).to eq true
      expect(hydratee.furniture_wrapping).to eq true
      expect(hydratee.gun_safe).to eq true
      expect(hydratee.packaging).to eq true
      expect(hydratee.personal_truck_loading).to eq true
      expect(hydratee.pianos).to eq true
      expect(hydratee.shuttling).to eq true
      expect(hydratee.storage).to eq true
    end

    it 'handles not found' do
      expect {
        subject.services(hydratee)
      }.to_not raise_exception
    end
  end

  describe '#licenses' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :company_registration,
                      :puc,
                      :state_dot,
                      :us_dot
      end.new
    }

    it 'assigns licenses' do
      create_mover_licenses(
        mover_id: 12,
        company_registration: 'abc-123',
        puc: 'abc-124',
        state_dot: 'abc-125',
        us_dot: 'abc-126'
      )

      subject.licenses(hydratee)

      expect(hydratee.company_registration).to eq 'abc-123'
      expect(hydratee.puc).to eq 'abc-124'
      expect(hydratee.state_dot).to eq 'abc-125'
      expect(hydratee.us_dot).to eq 'abc-126'
    end

    it 'handles not found' do
      expect {
        subject.licenses(hydratee)
      }.to_not raise_exception
    end
  end

  describe '#hours' do
    let(:hydratee) {
      Class.new(hydratee_class) do
        attr_accessor :hours_mon,
                      :hours_tue,
                      :hours_wed,
                      :hours_thu,
                      :hours_fri,
                      :hours_sat,
                      :hours_sun
      end.new
    }

    it 'assigns hours' do
      create_mover_opening_hour(
        mover_id: 12,
        day_of_week: 1,
        open: Time.zone.parse('8:00'),
        close: Time.zone.parse('16:00')
      )
      create_mover_opening_hour(
        mover_id: 12,
        day_of_week: 5,
        open: Time.zone.parse('6:00'),
        close: Time.zone.parse('20:00')
      )

      subject.hours(hydratee)

      expect(hydratee.hours_mon).to eq '08:00 - 16:00'
      expect(hydratee.hours_fri).to eq '06:00 - 20:00'
      expect(hydratee.hours_thu).to eq nil
    end

    it 'handles not found' do
      expect {
        subject.hours(hydratee)
      }.to_not raise_exception
    end
  end
end
