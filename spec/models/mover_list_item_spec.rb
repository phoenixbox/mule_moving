require 'spec_helper'

describe MoverListItem do
  describe '#yelp?' do
    it 'returns true when rating present' do
      mover_list_item = MoverListItem.new
      mover_list_item.yelp_stars = 5

      expect(mover_list_item.yelp?).to eq true
    end

    it 'returns false when rating absent' do
      mover_list_item = MoverListItem.new

      expect(mover_list_item.yelp?).to eq false
    end
  end
end