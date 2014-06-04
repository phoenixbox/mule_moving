require 'spec_helper'

describe MoverListFinder do
  describe '#for_location' do
    it 'currently ignores location and returns all movers' do
      mover = MoverEntity.new
      list_item = MoverListItem.new
      movers = [mover]
      allow_any_instance_of(MoverFinder).to receive(:all).and_return(movers)
      expect(MoverListItem).to receive(:new).with(mover).and_return(list_item)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:yelp).with(list_item)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:compliance).with(list_item)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:pricing).with(list_item)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:statistics).with(list_item)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:hero).with(list_item)

      results = subject.for_location('Boulder')

      first_mover = results.first
      expect(results.length).to eq 1
      expect(first_mover).to be_a MoverListItem
      expect(first_mover).to eq list_item
    end
  end
end