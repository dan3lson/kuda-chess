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

  scenario "\n complete a totally valid Game form" do
    visit new_game_path
    fill_in "Opponent First Name", with: "Paul"
    fill_in "Opponent Last Name", with: "Morphy"
    fill_in "Color", with: "black"
    fill_in "Result", with: "won"
    fill_in "Day", with: "08/06/1988"
    fill_in "Counter", with: 33
    click_on "Submit"

    expect(page).to have_content("Game created successfully.")
  end

  scenario "\n complete a totally invalid Game form" do
    visit new_game_path
    fill_in "Opponent First Name", with: ""
    fill_in "Opponent Last Name", with: ""
    fill_in "Color", with: ""
    fill_in "Result", with: ""
    fill_in "Day", with: ""
    fill_in "Counter", with: 0
    click_on "Submit"

    expect(page).to have_content("Yikes!")
    expect(page).to have_content("errors")
    expect(page).to have_content("Please fix")
  end

  scenario "\n complete a Game form w/invalid counter" do
    visit new_game_path
    fill_in "Opponent First Name", with: "Paul"
    fill_in "Opponent Last Name", with: "Morphy"
    fill_in "Color", with: "black"
    fill_in "Result", with: "won"
    fill_in "Day", with: "08/06/1988"
    fill_in "Counter", with: 1000
    click_on "Submit"

    expect(page).to have_content("Yikes!")
    expect(page).to have_content("error")
    expect(page).to have_content("Counter is not included in the list")
  end
end
