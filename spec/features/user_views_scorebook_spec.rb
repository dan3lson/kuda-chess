require 'rails_helper'

feature "user views Scorebook", %Q{
  As a user,
  I want to see all my games.
} do
  # Acceptance Criteria
  #
  # [x] I go to my Scorebook and see all my games
  # [x] Each game displays my color, opponent name, result, and date

  let!(:game) { FactoryGirl.create(:game) }

  scenario "\n expect to see a list of games" do
    visit games_path
    game

    expect(page).to have_content(game.opponent_fname)
    expect(page).to have_content(game.opponent_lname)
    # if game.color == "white"
    #   expect(page).to have_content("&#9898;")
    # else
    #   expect(page).to have_content("&#9899;")
    # end
    expect(page).to have_content(game.result)
    expect(page).to have_content(game.day)
    expect(page).to have_content("Games")
    expect(page).to have_link("New Game")
    expect(page).to have_link("Profile")
  end
end
