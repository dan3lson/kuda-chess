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

  let!(:game) { FactoryGirl.create(:game) }
  let!(:game2) { FactoryGirl.create(:game, result: "lost") }
  let!(:game3) { FactoryGirl.create(:game, result: "drew") }

  scenario "\n expect to see a list of games" do
    visit games_path

    expect(page).to have_content(game.opponent_fname)
    expect(page).to have_content(game.opponent_lname[0] << ".")
    # if game.color == "white"
    #   expect(page).to have_content("&#9898;")
    # else
    #   expect(page).to have_content("&#9899;")
    # end
    expect(page).to have_content(game.result)
    expect(page).to have_content("ago")
    expect(page).to have_content("Games")
    expect(page).to have_link("New Game")
    expect(page).to have_link("Profile")
  end
end
