require 'rails_helper'

feature "user deletes an existing game", %Q{
  As a user,
  I want to delete one of
  my games.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /games/:id/
  # [x] I see a delete button
  # [x] Clicking on 'delete' removes
  #     the game and displays page for all my games

  # Why doesn't a let!(:game) { ... } work?
  # Are test objects being deleted after each scenario, etc.?

  describe "\n delete game from its show page" do
    let(:game) { FactoryGirl.create(:game) }

    scenario "from the show page" do
      visit game_path(game)

      click_on "Delete Game"

      expect(page).to have_content("Game deleted successfully.")
      expect(Game.count).to eq(0)
    end
  end
end
