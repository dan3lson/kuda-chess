require 'rails_helper'

feature "user views a game\'s show page", %Q{
  As a user,
  I want to view a specific game
  and see its moves.
} do
  # Acceptance Criteria
  #
  # [] I can visit /games/1
  # [] I can see the games details
  let!(:game) { FactoryGirl.create(:game) }

  scenario "\n expect to see a specific game" do
    visit game_path(game)

    expect(page).to have_content(game.opponent_fname)
    expect(page).to have_content(game.opponent_lname)
    #expect(page).to have_content(game.color)
    #expect(page).to have_content("&#9898;")
    expect(page).to have_content(game.result)
    expect(page).to have_content("ago")
    expect(page).to have_content(game.counter)
  end
end
