require 'rails_helper'

feature "user adds one move for a game", %Q{
  As a user,
  I want to add one move to a
  a game I've already saved.
} do
  
  # Acceptance Criteria
  #
  # [x] I can visit /games/:id
  # [x] I can what the latest move is
  # [x] I can a form to add a move
  #     for white and black
  # [x] After submitting, I can see the move
  #     I just added
  # [x] I see errors on the page if fields
  #     are left blank

  let(:game) { FactoryGirl.create(:game) }

  scenario "\n complete a valid Move form" do
    visit game_path(game)
    fill_in "White", with: "d4"
    fill_in "Black", with: "d5"
    click_on "Submit"

    expect(page).to have_content("Move successfully added.")
    expect(page).to have_content("d4")
    expect(page).to have_content("d5")
  end

  scenario "\n complete an invalid Move form" do
    visit game_path(game)
    fill_in "White", with: ""
    fill_in "Black", with: ""
    click_on "Submit"

    expect(page).to_not have_content("Move successfully added.")
    expect(page).to have_content("Move not successfully added.")
    expect(page).to have_content("Yikes! Please fix")
    expect(page).to have_content("error")
  end

end