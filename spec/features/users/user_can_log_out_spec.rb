require 'rails_helper'

RSpec.feature "User can log out" do
  scenario "they can log out" do
    user = User.create(username: "steve", password: "pass")

    visit login_path
    fill_in "user[name]", with: "steve"
    fill_in "user[password]", with: "pass"
    click_on "Login"

    click_on "Logout"
    expect(current_path).to eq(root)
    expect(page).to have_content("Logout successful!")
    expect(page).to have_content("Login")
  end
end
