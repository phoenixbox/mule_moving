require 'spec_helper'

describe MoverListFinder do
  describe '#for_location' do
    it 'currently ignores location and returns all movers' do
      create_mover name: 'Mafia Movers'
      create_mover name: 'Friendly Movers'

      mover_list_items = subject.for_location('Vail, CO')

      expect(mover_list_items.length).to eq 2

      expect(mover_list_items.first).to be_a MoverListItem
      expect(mover_list_items.map(&:name)).to match_array ['Mafia Movers', 'Friendly Movers']
    end
  end
end