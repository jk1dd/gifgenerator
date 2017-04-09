require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context "relationships" do
    it "belongs to user" do
      fav = Favorite.create(user_id: 1, gif_id: 1)

      expect(fav).to respond_to(:user)
    end

    it "belongs to gif" do
      fav = Favorite.create(user_id: 1, gif_id: 1)

      expect(fav).to respond_to(:gif)
    end
  end
end
