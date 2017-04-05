require 'rails_helper'

RSpec.feature "User can create an account" do
  context "when providing all infor" do
    scenario "they are logged in successfully" do
      visit new_user_path

      fill_in "user[username]", with: "jk"
      fill_in "user[email]", with: "sample@sample.com"
      fill_in "user[password]", with: "password"
      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Successfully logged in!")
      expect(page).to have_content("Welcome, jk!")
    end
  end

  context "when not providing all info" do
    scenario "they are redirected to try again" do
      visit new_user_path

      fill_in "user[username]", with: "jk"
      fill_in "user[email]", with: ""
      fill_in "user[password]", with: "password"
      click_on "Create Account"

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Retry login!")
      expect(page).to_not have_content("Welcome, jk!")
    end
  end
end
