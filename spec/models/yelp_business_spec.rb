require 'rails_helper'

describe YelpBusiness do
  describe '#stars' do
    it 'return 5 if @stars is 5.0' do
      subject.stars = 5.0

      expect(subject.stars).to eq 5
    end

    it 'acts normally otherwise' do
      subject.stars = 4.5

      expect(subject.stars).to eq 4.5
    end
  end
end