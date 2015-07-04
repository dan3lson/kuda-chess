require 'rails_helper'

feature "user deletes an existing game", %{

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

  # Are test objects being deleted after each scenario, etc.?

  describe "\n delete game from its show page" do
    let(:game) { FactoryGirl.create(:game) }
    let(:user) { game.user }

    scenario "scenario: from the show page" do
      log_in

      visit game_path(game)

      click_on "Delete Game"

      expect(page).to have_content("Game deleted successfully.")
      expect(user.games.count).to eq(0)
    end
  end
end
