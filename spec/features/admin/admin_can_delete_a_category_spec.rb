require "rails_helper"

RSpec.feature "admin can delete a category" do
  context "while visiting category index" do
    it "admin can use delete button to remove category" do
      admin = User.create(username: "steve",
      email: "test",
      password: "pass",
      role: 1)
      category = Category.create(name: "whatever")
      gif = category.gifs.create(image_url: "http://giphy.com/embed/11sBLVxNs7v6WA")
      user = User.create(username: "steve",
      email: "test",
      password: "pass",
      role: 0)
      user.gifs << gif

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path

      click_on "delete this"

      expect(current_path).to eq(categories_path)
      expect(user.gifs.count).to eq(0)
      expect(category.gifs.count).to eq(0)
      expect(page).to_not have_link("whatever")

    end
  end
end
