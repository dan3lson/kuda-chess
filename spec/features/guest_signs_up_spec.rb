require 'rails_helper'

feature "guest signs up", %{

  As a guest,
  I want to create my account.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /signup
  # [x] I can see a form
  # [x] I see a button to create my account
  # [x] I can see errors if info isn't valid

  describe "\n guest signs up" do
    scenario "scenario: with valid data" do
      before_count = User.count

      visit root_path

      click_on "Sign Up for Free"

      fill_in "Username", with: "FooFoo"
      fill_in "Password", with: "foobar"
      fill_in "Password Confirmation", with: "foobar"

      click_on "Create my account"

      after_count = User.count

      expect(page).to have_content("Welcome to Kuda")
      expect(page).to have_content("Hey, you don't have any games. Create a new game now!")
      expect(page).to_not have_content("errors")
      expect(page).to_not have_content("fix")
      expect(page).to have_content("Games")
      expect(page).to have_link("New Game")
      expect(page).to have_link("Profile")
      expect(before_count + 1).to eq(after_count)
    end

    scenario "scenario with invalid data" do
      before_count = User.count

      visit root_path

      click_on "Sign Up for Free"

      fill_in "Username", with: ""
      fill_in "Password", with: ""
      fill_in "Password Confirmation", with: ""

      click_on "Create my account"

      after_count = User.count

      expect(page).to_not have_content("Welcome to Kuda")
      expect(page).to have_content("errors")
      expect(page).to have_content("fix")
      #expect(page).to_not have_link("Games")
      #expect(page).to_not have_link("New Game")
      #expect(page).to_not have_link("Profile")
      expect(before_count).to eq(after_count)
    end
  end
end
