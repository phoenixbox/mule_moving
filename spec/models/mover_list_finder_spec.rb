require 'spec_helper'

describe MoverListFinder do
  describe '#for_location' do
    it 'currently ignores location and returns all movers' do
      mover_list_item = MoverListItem.new
      yelp_business = YelpBusiness.new
      mover_entity = MoverEntity.new
      mover_entity.id = 5
      mover_yelp_record = MoverYelpRecord.new
      mover_yelp_record.yelp_id = 'bang-yelp-id-yo'
      expect_any_instance_of(MoverFinder).to receive(:all).and_return([mover_entity])
      expect_any_instance_of(YelpFinder).to receive(:find_business).with('bang-yelp-id-yo').and_return(yelp_business)
      expect(MoverYelpRecord).to receive(:find_by).with(mover_id: 5).and_return(mover_yelp_record)
      expect_any_instance_of(MoverListItemBuilder).to receive(:build).with(mover_entity, yelp_business).and_return(mover_list_item)

      mover_list_items = subject.for_location('Vail, CO')

      expect(mover_list_items.length).to eq 1
      expect(mover_list_items.first).to eq mover_list_item
    end

    it 'handles no yelp id' do
      mover_list_item = MoverListItem.new
      mover_entity = MoverEntity.new
      mover_entity.id = 5
      expect_any_instance_of(MoverFinder).to receive(:all).and_return([mover_entity])
      expect_any_instance_of(YelpFinder).to_not receive(:find_business)
      expect(MoverYelpRecord).to receive(:find_by).with(mover_id: 5).and_return(nil)
      expect_any_instance_of(MoverListItemBuilder).to receive(:build).with(mover_entity, nil).and_return(mover_list_item)

      mover_list_items = subject.for_location('Vail, CO')

      expect(mover_list_items.length).to eq 1
      expect(mover_list_items.first).to eq mover_list_item
    end
  end
end