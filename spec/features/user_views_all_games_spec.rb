require 'rails_helper'

feature "user views all games", %{

  As a user,
  I want to see all my games
  and click on a result to see
  that respective game's show page.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /games and see all my games
  # [x] Each game displays my color, opponent name, result,
  #     and date
  # [x] There are links leading to every game's show page
  # [x] If a game doesn't have moves, display a knight

  describe "\n view all games" do
    let(:move) { FactoryGirl.create(:move) }
    let(:game) { move.game }
    let(:user2) { game.user }
    let(:user) { game2.user }
    let!(:game2) { FactoryGirl.create(:game) }

    scenario "scenario: games without moves" do

      log_in

      visit games_path

      game2.opponent_fname = "Paul"

      expect(page).to have_content(game2.opponent_fname)
      expect(page).to have_content(game2.opponent_lname)

      if game.color == "white"
        expect(page).to have_css("span.white_circle")
      else
        expect(page).to have_content("span.black_circle")
      end

      expect(page).to have_link(game2.result)
      expect(page).to have_content("on")
      expect(page).to have_content("♘")
      expect(page).to have_content("Games")
      expect(page).to have_link("New Game")
      expect(page).to have_link("Profile")
    end

    scenario "scenario: games with moves" do
      3.times do
        game.opponent_lname[-1] = ""
      end

      log_in

      visit games_path

      game.opponent_fname = "Paul"

      expect(page).to have_content(game.opponent_fname)
      expect(page).to have_content(game.opponent_lname)

      if game.color == "white"
        expect(page).to have_css("span.white_circle")
      else
        expect(page).to have_css("span.black_circle")
      end

      expect(page).to have_link(game.result)
      expect(page).to have_content("on")
      # How to test for this for this line?
      # expect(page).to_not have_content("♘")
      expect(page).to have_content("Games")
      expect(page).to have_link("New Game")
      expect(page).to have_link("Profile")
    end
  end
end
