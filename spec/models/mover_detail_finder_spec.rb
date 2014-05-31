require 'spec_helper'

describe MoverDetailFinder do
  describe '#for_id' do
    it 'returns a mover_detail' do
      mover_detail = subject.for_id(12)

      expect(mover_detail.id).to eq 12
      expect(mover_detail.name).to eq 'Mafioso Movers'
      expect(mover_detail.description).to eq 'You are safe now'
      expect(mover_detail.description).to eq 'You are safe now'
    end
  end
end