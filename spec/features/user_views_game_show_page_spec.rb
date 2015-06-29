require 'rails_helper'

feature "user views a game\'s show page", %Q{
  As a user,
  I want to view a specific game
  and see its moves.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /games/1
  # [x] I can see the games details

  let!(:game) { FactoryGirl.create(:game) }

  scenario "\n expect to see a specific game" do
    visit game_path(game)

    expect(page).to have_content(game.opponent_fname)
    expect(page).to have_content(game.opponent_lname)
    expect(page).to have_content("⚪")
    expect(page).to have_content(game.result)
    expect(page).to have_content("on")
  end
end
