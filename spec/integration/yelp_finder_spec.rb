require 'spec_helper'

describe YelpFinder do
  describe '#find_business', type: :integration do
    it 'returns a yelp business' do
      business = subject.find_business('yelp-san-francisco')

      expect(business.rating).to be_a Float
      expect(business.review_count).to be_a Fixnum
      expect(business.url).to be_a String
      expect(business.mobile_url).to be_a String
      expect(business.rating_img_url).to be_a String
      expect(business.rating_img_url_small).to be_a String
      expect(business.snippet_text).to be_a String
    end

    it 'returns nil if not found' do
      expect(subject.find_business('unknown-business-id')).to eq nil
    end
  end
end