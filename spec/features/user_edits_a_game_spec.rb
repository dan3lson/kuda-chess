require 'rails_helper'

feature "user creates a new game", %Q{
  As a user,
  I want to edit one of my games.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /games/:id
  # [x] I can complete a form for game details
  # [x] Submitting the form redirect to that
  #     game's show page
  let!(:game) {FactoryGirl.create(:game) }

  scenario "\n update a totally valid Game form" do
    visit game_path(game)
    click_on "Edit Game"
    fill_in "Opponent First Name", with: "Paulie"
    fill_in "Opponent Last Name", with: "Morphie"
    fill_in "Color", with: "white"
    fill_in "Result", with: "lost"
    fill_in "Day", with: "08/06/2015"
    click_on "Submit"

    expect(page).to have_content("Game edited successfully.")
    expect(page).not_to have_content("Game not edited successfully.")
  end

  scenario "\n update a totally invalid Game form" do
    visit game_path(game)
    click_on "Edit Game"
    fill_in "Opponent First Name", with: ""
    fill_in "Opponent Last Name", with: ""
    fill_in "Color", with: ""
    fill_in "Result", with: ""
    fill_in "Day", with: ""
    click_on "Submit"

    expect(page).to have_content("Game not edited successfully.")
    expect(page).to_not have_content("Game edited successfully.")
    expect(page).to have_content("Yikes!")
    expect(page).to have_content("errors")
    expect(page).to have_content("Please fix")
  end
end
