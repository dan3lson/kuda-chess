require 'rails_helper'

feature "user edits their profile", %{

  As a user,
  I want to update my profile.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /users/:id/edit
  # [x] I can see a form
  # [x] I see a button to update my account
  # [x] I can see errors if info isn't valid

  describe "\n user updates account" do
    let(:user) { FactoryGirl.create(:user) }
    
    scenario "scenario: with valid data" do
      log_in

      click_on "Profile"

      click_on "Edit My Info"

      fill_in "Username", with: "FoooFooo"
      fill_in "Password", with: "fooobar"
      fill_in "Password Confirmation", with: "fooobar"

      click_on "Save changes"

      expect(page).to have_content("Changes successfully made.")
      expect(page).to_not have_content("errors")
      expect(page).to_not have_content("fix")
      expect(page).to have_link("Games")
      expect(page).to have_link("New Game")
      expect(page).to have_content("Profile")
    end

    scenario "scenario with invalid data" do
      log_in

      click_on "Profile"

      click_on "Edit My Info"

      fill_in "Username", with: ""
      fill_in "Password", with: ""
      fill_in "Password Confirmation", with: ""

      click_on "Save changes"

      expect(page).to have_content("Changes not successfully made.")
      expect(page).to have_content("errors")
      expect(page).to have_content("fix")
      expect(page).to have_link("Games")
      expect(page).to have_link("New Game")
      expect(page).to have_content("Profile")
    end
  end
end
