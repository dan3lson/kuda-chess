require 'rails_helper'

feature "guest visits unathorized page", %{

  As a guest,
  I visit a page that one
  can only get to if logged in.
} do

  # Acceptance Criteria
  #
  # [x] I get redirected to the login_path
  # [x] I can see a friendly message

  describe "\n visit unathorized pages" do
    let(:user) { FactoryGirl.create(:user) }

    scenario "scenario: guest visits an edit user page" do
      visit edit_user_path(user)

      expect(page).to have_content("Yikes! Please log in first to do that.")
      expect(page).to have_css("form")
      expect(page).to have_button("Log in")
      expect(page).to have_content("New user?")
      expect(page).to have_link("Sign up now")
    end
  end
end
