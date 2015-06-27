require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { FactoryGirl.create(:game) }

  describe "associatons" do
    it { should belong_to(:user) }
    it { should have_many(:moves) }
  end

  describe "validations" do
    it { should validate_presence_of(:opponent_fname) }
    it { should validate_presence_of(:opponent_lname) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:result) }
  end

  describe "#initialization" do
    it "returns an opponent first name string" do
      expect(game.opponent_fname).to include("Paul")
    end
    it "returns an opponent last name string" do
      expect(game.opponent_lname).to include("Morphy")
    end
    it "returns player color string" do
      expect(game.color).to include("white")
    end
    it "returns player color string" do
      expect(game.result).to include("0-1")
    end
  end
end
