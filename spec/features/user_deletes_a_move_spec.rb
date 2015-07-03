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
  #     the move and remains on the show page

  # Are test objects being deleted after each scenario, etc.?

  describe "\n delete move from its show page" do
    let(:game) { FactoryGirl.create(:game) }
    let(:move1) { FactoryGirl.create(:move) }
    let(:move2) { FactoryGirl.create(:move) }
    let(:move3) { FactoryGirl.create(:move) }
    let(:move4) { FactoryGirl.create(:move) }

    scenario "scenario: from the show page" do
      game.moves << move1
      game.moves << move2
      game.moves << move3
      game.moves << move4

      visit game_path(game)

      click_link("Delete", match: :first)

      expect(page).to have_content("Move deleted successfully.")
      expect(game.moves.count).to eq(3)
    end
  end
end
