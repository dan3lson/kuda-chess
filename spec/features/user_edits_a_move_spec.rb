require 'rails_helper'

feature "user edits a move", %{

  As a user,
  I want to edit one of my moves.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /games/:id/moves/:id/edit
  # [x] I can complete a form for move details
  # [x] I see errors on the page if fields
  #     are left blank
  # [x] Submitting the form redirects to that
  #     game's show page

  describe "\n edit a Move form" do
    let!(:move) { FactoryGirl.create(:move) }
    let!(:game) { move.game }
    let!(:user) { game.user }

    scenario "scenario: updates are valid" do
      log_in

      visit edit_game_move_path(game, move)
      # click_on "&#10000;".html_safe
      fill_in "White", with: "c4"
      fill_in "Black", with: "c5"
      click_on "Submit"

      expect(page).to have_content("Move edited successfully.")
      expect(page).not_to have_content("Move not edited successfully.")
    end

    scenario "scenario: updates are invalid" do
      log_in
      visit edit_game_move_path(game, move)
      # click_on "✐"
      fill_in "White", with: ""
      fill_in "Black", with: ""
      click_on "Submit"

      expect(page).to have_content("Move not edited successfully.")
      expect(page).to_not have_content("Move edited successfully.")
      expect(page).to have_content("Yikes!")
      expect(page).to have_content("errors")
      expect(page).to have_content("Please fix")
    end
  end
end
