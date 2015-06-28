require 'rails_helper'

RSpec.describe Move, type: :model do
  let(:move) { FactoryGirl.create(:move) }

  describe "associatons" do
    it { should belong_to(:game) }
  end

  describe "validations" do
    it { should validate_presence_of(:white) }
    it { should validate_presence_of(:black) }
    it { should validate_presence_of(:game) }
  end

  describe "#initialization" do
    it "returns white\'s move string" do
      expect(move.white).to include("e4")
    end
    it "returns black\'s move string" do
      expect(move.black).to include("c5")
    end
    it "returns a Game object type" do
      expect(move.game.class).to be(Game)
    end
  end
end
