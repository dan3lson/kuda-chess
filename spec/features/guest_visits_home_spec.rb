require 'rails_helper'

feature "guest visits home page", %{
  As a guest,
  I want to go to the Kuda.com homepage.
} do

  # Acceptance Criteria
  #
  # [x] I can visit /
  # [x] I can see the Kuda logo
  # [x] I see a button to sign up
  # [x] I can see a button to log in

  describe "visit home page" do
    scenario "\n homepage content is displayed" do
      visit root_path

      expect(page).to have_content("Kuda")
      expect(page).to have_link("Sign Up for Free")
      expect(page).to have_link("Log in.")
      expect(page).to have_content("Copyright 2015 Kuda")
    end
  end
end
