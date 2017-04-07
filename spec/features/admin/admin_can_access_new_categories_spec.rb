require 'rails_helper'

describe "A visit to categories new page" do
  context "as admin" do
    it "allows admin to create a new category" do
      admin = User.create(username: "steve", email: "s@s.com", password: "s", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit new_admin_category_path
      expect(page).to have_content("Create New Category")
    end
  end

  context "as default" do
    it "does not allow user to see creatino page" do
      user = User.create(username: "steve", email: "s@s.com", password: "s", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_admin_category_path
      expect(page).to_not have_content("Create New Category")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
