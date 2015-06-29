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
  let!(:game2) { FactoryGirl.create(:game) }
  let!(:move) { FactoryGirl.create(:move) }
  let!(:move2) { FactoryGirl.create(:move) }

  scenario "\n expect to see a specific game without moves" do
    visit game_path(game)

    expect(page).to have_content(game.opponent_fname)
    expect(page).to have_content(game.opponent_lname)
    expect(page).to have_content("⚪")
    expect(page).to have_content(game.result)
    expect(page).to have_content("on")
    expect(page).to have_content("♘ This game is empty - add moves below! ♘")
    expect(page).to have_content("1.")
  end

  scenario "\n expect to see a specific game with over 2 moves" do
    game2.moves << move
    game2.moves << move2

    visit game_path(game2)

    expect(page).to have_content(game2.opponent_fname)
    expect(page).to have_content(game2.opponent_lname)
    expect(page).to have_content("⚪")
    expect(page).to have_content(game2.result)
    expect(page).not_to have_content("♘ This game is empty - add moves below! ♘")
    expect(page).to have_content("on")
    expect(page).to have_content("1.")
    expect(page).to have_content("2.")
    expect(page).to have_content("3.")
  end
end
