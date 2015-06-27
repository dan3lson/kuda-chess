require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }

  describe "associatons" do
    it { should have_many(:games) }
    it { should have_many(:moves) }
  end

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "#initialization" do
    it "returns a username string" do
      expect(user.username).to include("bfisch")
    end
  end
end
