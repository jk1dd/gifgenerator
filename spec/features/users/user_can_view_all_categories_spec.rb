require 'rails_helper'

RSpec.feature "user sees category index page" do
  context 'viewing category index' do
    it 'index page has links to categories' do
      category_1 = Category.create(name: "fun")
      category_2 = Category.create(name: "boring")
      category_1.gifs.create(image_url: "http://giphy.com/embed/11sBLVxNs7v6WA")

      visit categories_path

      expect(current_path).to eq(categories_path)
      expect(page).to have_content("fun")
      expect(page).to have_content("boring")

      click_on("fun")
      expect(current_path).to eq(category_path(category_1))
      expect(page).to have_content("fun gifs")
      expect(page).to have_css("iframe")
    end
  end
end
