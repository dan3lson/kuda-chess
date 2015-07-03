require 'rails_helper'

feature "user logs in", %{
  
  As a user,
  I want to log into Kuda.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /login
  # [x] I can complete a form for user info
  # [x] I see errors on the page if fields
  #     are left blank
  # [x] Submitting the form redirects to my game_path(:id)

  describe "user logs in" do
    let(:user) { FactoryGirl.create(:user) }

    scenario "scenario: input is valid" do
      log_in

      expect(page).to have_content("Welcome back, #{user.username}!")
      expect(page).not_to have_content("Invalid email and / or password combination.")
    end

    scenario "scenario: input is invalid" do
      visit login_path

      fill_in "Username", with: ""
      fill_in "Password", with: ""
      click_on "Log in"

      expect(page).not_to have_content("Welcome back, #{user.username}")
      expect(page).to have_content("Invalid email and / or password combination.")
    end
  end
end
