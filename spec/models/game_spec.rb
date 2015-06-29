require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { FactoryGirl.create(:game) }
  let(:move) { FactoryGirl.create(:move) }
  let(:move2) { FactoryGirl.create(:move, white: "Nf3", black: "g6") }
  let(:move3) { FactoryGirl.create(:move, white: "Nc3", black: "Bg7") }

  describe "associatons" do
    it { should belong_to(:user) }
    it { should have_many(:moves) }
  end

  describe "validations" do
    it { should validate_presence_of(:opponent_fname) }
    it { should validate_presence_of(:opponent_lname) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:result) }
    it { should validate_presence_of(:day) }
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
      expect(game.result).to include("won")
    end
    it "returns a day string" do
      expect(game.day.to_s).to include("08-06")
    end
  end

  describe "#has_moves?" do
    it "returns false" do
      expect(game.has_moves?).to eq(false)
    end
    it "returns true" do
      game.moves << move
      expect(game.has_moves?).to eq(true)
    end
  end

  describe "#next_move_number" do
    it "returns a string showing the next available move" do
      game.moves << move
      game.moves << move2
      game.moves << move3
      expect(game.next_move_number).to eq("4.")
    end
  end

  describe "#display_better_date" do
    it "returns a string with a date format of dd/mm/yy" do
      expect(game.display_better_date).to include("08/06/197")
    end
  end
end
