# require 'rails_helper'
#
# feature "user logs in for the first time", %Q{
#   As a user,
#   I'm logging in for the first
#   time with a fresh account.
# } do
#   # Acceptance Criteria
#   #
#   # [] I am taken to the Scorebook page by default
#   # [x] I must see a message saying I don't
#   #     have any games saved
#   # [x] I must see Scorebook is current page and see links to
#   #     New Game and Profile
#
#   scenario "\n expect to have a blank slate" do
#     visit games_path
#
#     expect(page).to have_content("Games")
#     expect(page).to have_link("New Game")
#     expect(page).to have_link("Profile")
#     expect(page).to have_content("you don\'t have any games saved.")
#   end
# end
