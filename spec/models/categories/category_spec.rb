require 'rails_helper'

RSpec.describe Category, type: :model do
  context "relationships" do
    it "has many gifs" do
      category = Category.create(name: "whatever")
      # gif = Gif.new(image_url: "http://giphy.com/embed/11sBLVxNs7v6WA", category_id: 1 )

      expect(category).to respond_to(:gifs)
    end
  end
end
