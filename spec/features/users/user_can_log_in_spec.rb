require 'rails_helper'

RSpec.feature "User can log in" do
  context "they provide correct deets" do
    scenario "they can log in" do
      user = User.create(username: 'steve', password: 'pass')

      visit login_path

      fill_in "Username", with: "steve"
      fill_in "Password", with: "pass"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Login successful!")
      expect(page).to have_content("Welcome, steve")
      expect(page).to have_content("Logout")
    end
  end

  context "they provide incorrect deets" do
    scenario "they cannot log in" do
      user = User.create(username: 'steve', password: 'pass')

      visit login_path

      fill_in "Username", with: "steve"
      fill_in "Password", with: "iforget"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Login failed")
      expect(page).to_not have_content("Welcome, steve")
      expect(page).to_not have_content("Logout")
    end
  end
end
