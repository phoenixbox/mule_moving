require "rails_helper"

describe MoverFinder do
  describe "#all" do
    it "returns all movers" do
      mover1 = create_mover
      mover2 = create_mover

      all = subject.all
      expect(all.length).to eq 2
      expect(all.first.class).to eq MoverEntity
      expect(all.map(&:name)).to match_array [mover1.name, mover2.name]
    end
  end

  describe "#find_by_id" do
    it "returns mover entity" do
      mover = create_mover

      found = subject.find_by_id(mover.id)

      expect(found.id).to eq mover.id
      expect(found.class).to eq MoverEntity
    end

    it "raises when not found" do
      expect {
        subject.find_by_id(5)
      }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end