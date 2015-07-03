require 'rails_helper'

feature "user logs out", %{

  As a user,
  I want to log out of Kuda.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /login
  # [x] I can sign in
  # [x] I can sign out
  # [x] I'm taken to the root_path

  describe "\n user logs out" do
    let(:user) { FactoryGirl.create(:user) }

    scenario "scenario: logs out" do
      log_in

      click_on "Profile"

      click_on "Log out"

      expect(page).to have_content("Successfully logged out. See you again soon!")
      expect(page).to have_link("Sign Up for Free")
      expect(page).to have_link("Log in")
      expect(page).to have_content("Already have an account?")
    end
  end
end
