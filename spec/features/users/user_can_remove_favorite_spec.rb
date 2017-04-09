require 'rails_helper'

RSpec.describe "user visits user show page" do
  context "user can unfavorite gif" do
    it "gif appears on user show page where user can unfavorite it" do
      category = Category.create(name: "water")
      gif = Gif.create(image_url: "http://giphy.com/embed/11sBLVxNs7v6WA", category_id: 1 )
      user = User.create(username: "steve",
      email: "test",
      password: "pass",
      role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit category_path(category)

      click_on "Add to Favorites"

      expect(current_path).to eq(category_path(category))
      expect(page).to have_content("Successfully added to favorites!")

      visit user_path(user)

      expect(current_path).to eq(user_path(user))
      expect(page).to have_css("iframe")
      expect(user.favorites.count).to eq(1)

      click_on "Remove from Favorites"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Successfully removed from favorites!")
      expect(page).to_not have_css("iframe")
      expect(user.favorites.count).to eq(0)
    end
  end
end
