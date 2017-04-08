require 'rails_helper'

RSpec.describe "Admin visits new categories page" do
  it "admin can create a new category" do
    admin = User.create(username: "steve",
    email: "test",
    password: "pass",
    role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path

    fill_in "category[name]", with: "happy"

    click_on "Create Category"

    expect(current_path).to eq(category_path(Category.last))
    expect(Gif.where(id: 1, image_url: "http://giphy.com/embed/11sBLVxNs7v6WA" )).to exist
    expect(page).to have_content("happy gifs")
  end

  # Xit "if category exists new one doesn't get created"
end
