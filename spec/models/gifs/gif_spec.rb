require 'rails_helper'

RSpec.describe Gif, type: :model do
  context "relationships" do
    it "belongs to category" do
      gif = Gif.new(image_url: "http://giphy.com/embed/11sBLVxNs7v6WA", category_id: 1 )

      expect(gif).to respond_to(:category)
    end

    it "has many users" do
      gif = Gif.new(image_url: "http://giphy.com/embed/11sBLVxNs7v6WA", category_id: 1 )

      expect(gif).to respond_to(:users)
    end
  end
end
