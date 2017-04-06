require 'rails_helper'

RSpec.feature "User can log out" do
  scenario "they can log out" do
    user = User.create(username: "steve", email: "s@s.com", password: "pass")

    visit login_path
    fill_in "session[username]", with: "steve"
    fill_in "session[password]", with: "pass"
    click_on "Log In"

    expect(current_path).to eq(user_path(user))

    click_on "Logout"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logout successful!")
    expect(page).to have_button("Log In")
  end
end
