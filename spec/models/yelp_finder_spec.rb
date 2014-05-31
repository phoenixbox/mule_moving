require 'spec_helper'

describe YelpFinder do
  let(:client) { double('client') }

  subject { YelpFinder.new(client) }

  describe '#find_business' do
    it 'returns a yelp business' do
      yelp_business = double(
        'yelp business',
        rating: 2.5,
        review_count: 12,
        url: 'www.yelp.com/your-mover',
        rating_img_url: 'www.example.com/image/1',
        rating_img_url_small: 'www.example.com/image/1/small',
        snippet_text: 'These guys were...'
      )

      allow(client).to receive(:business).with('yelp-san-francisco').and_return(yelp_business)

      business = subject.find_business('yelp-san-francisco')

      expect(business).to be_a YelpBusiness
      expect(business.rating).to eq 2.5
      expect(business.review_count).to eq 12
      expect(business.url).to eq 'www.yelp.com/your-mover'
      expect(business.rating_img_url).to eq 'www.example.com/image/1'
      expect(business.rating_img_url_small).to eq 'www.example.com/image/1/small'
      expect(business.snippet_text).to eq 'These guys were...'
    end

    it 'returns nil if not found' do
      allow(client).to receive(:business).with('unknown-business-id').and_raise(JSON::ParserError)

      expect(subject.find_business('unknown-business-id')).to eq nil
    end
  end
end