require 'rails_helper'

feature "user creates a new game", %Q{
  As a user,
  I want to add a game
  to my collection.
} do
  # Acceptance Criteria
  #
  # [x] I can visit /games/new
  # [x] I can complete a form for game details
  # [] I can complete a form for the moves of
  #    the game

  scenario "\n expect to see a Game form" do
    visit new_game_path
    fill_in "Opponent First Name", with: "Paul"
    fill_in "Opponent Last Name", with: "Morphy"
    fill_in "Color", with: "black"
    fill_in "Result", with: "won"
    fill_in "Day", with: "08/06/1988"
    click_on "Submit"

    expect(page).to have_content("Game created successfully.")
  end
end
