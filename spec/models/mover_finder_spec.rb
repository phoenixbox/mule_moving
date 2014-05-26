require 'spec_helper'

describe MoverFinder do
  describe '#all' do
    it 'returns all movers' do
      mover1 = create_mover
      mover2 = create_mover

      expect(subject.all).to match_array [mover1, mover2]
    end
  end

  describe '#find_by_id' do
    it 'returns mover entity' do
      mover = create_mover

      expect(subject.find_by_id(mover.id)).to eq mover
    end

    it 'raises when not found' do
      expect {
        subject.find_by_id(5)
      }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end