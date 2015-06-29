require 'rails_helper'

feature "user views all games", %Q{
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

  let!(:game) { FactoryGirl.create(:game) }
  let!(:game2) { FactoryGirl.create(:game, result: "lost") }
  let!(:game3) { FactoryGirl.create(:game, result: "drew") }
  let!(:game4) { FactoryGirl.create(:game) }
  let!(:move) { FactoryGirl.create(:move) }

  scenario "\n expect to see a list of games without moves" do
    visit games_path

    expect(page).to have_content(game.opponent_fname)
    expect(page).to have_content(game.opponent_lname[0] << ".")
    if game.color == "white"
      expect(page).to have_content("⚪")
    else
      expect(page).to have_content("⚫")
    end
    expect(page).to have_link(game.result)
    expect(page).to have_link(game2.result)
    expect(page).to have_link(game3.result)
    expect(page).to have_content("on")
    expect(page).to have_content("♘")
    expect(page).to have_content("Games")
    expect(page).to have_link("New Game")
    expect(page).to have_link("Profile")
  end

  scenario "\n expect to see a list of games with moves" do
    game4.moves << move
    visit games_path

    expect(page).to have_content(game4.opponent_fname)
    expect(page).to have_content(game4.opponent_lname[0] << ".")
    if game.color == "white"
      expect(page).to have_content("⚪")
    else
      expect(page).to have_content("⚫")
    end
    expect(page).to have_link(game4.result)
    expect(page).to have_content("on")
    # How to test for this for this line?
    # expect(page).to_not have_content("♘")
    expect(page).to have_content("Games")
    expect(page).to have_link("New Game")
    expect(page).to have_link("Profile")
  end
end
