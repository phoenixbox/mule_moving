require 'spec_helper'

describe MoverDetailFinder do
  describe '#for_id' do
    it 'returns a mover_detail' do
      mover_entity = MoverEntity.new
      mover_detail = MoverDetail.new
      expect_any_instance_of(MoverFinder).to receive(:find_by_id).with(12).and_return(mover_entity)
      expect(MoverDetail).to receive(:new).with(mover_entity).and_return(mover_detail)

      expect_any_instance_of(MoverAssociationsHydrator).to receive(:yelp).with(mover_detail)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:pricing).with(mover_detail)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:compliance).with(mover_detail)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:statistics).with(mover_detail)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:address).with(mover_detail)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:hero).with(mover_detail)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:licenses).with(mover_detail)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:hours).with(mover_detail)
      expect_any_instance_of(MoverAssociationsHydrator).to receive(:services).with(mover_detail)

      mover_detail = subject.for_id(12)

      expect(mover_detail).to be_a MoverDetail
      expect(mover_detail).to eq mover_detail
    end

    it 'handles mover not found' do
      expect {
        subject.for_id(11)
      }.to raise_exception ActiveRecord::RecordNotFound
    end
  end
end