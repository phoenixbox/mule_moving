require 'spec_helper'

describe MoverListItemBuilder do
  describe '#build' do
    it 'merges the entity and business' do
      mover = MoverEntity.new
      mover.id = 9
      mover.name = 'Taylor Moving'
      mover.description = 'Good Mover'

      business = YelpBusiness.new
      business.rating = 5
      business.review_count = 10
      business.snippet_text = 'Was a good move'

      list_item = MoverListItemBuilder.new.build(mover, business)

      expect(list_item.id).to eq 9
      expect(list_item.name).to eq 'Taylor Moving'
      expect(list_item.description).to eq 'Good Mover'
      expect(list_item.rating).to eq 5
      expect(list_item.review_count).to eq 10
      expect(list_item.review).to eq 'Was a good move'
    end

    it 'handles business as nil' do
      mover = MoverEntity.new

      expect {
        MoverListItemBuilder.new.build(mover, nil)
      }.to_not raise_exception
    end
  end
end