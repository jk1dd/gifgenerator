require 'rails_helper'

RSpec.describe User do
  context "roles" do
    it "can be created as admin" do
      user = User.create(username: "steve",
      email: "test",
      password: "pass",
      role: 1)
      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
      expect(user.default?).to be_falsey
    end

    it "can be created as default" do
      user = User.create(username: "steve",
      email: "test",
      password: "pass",
      role: 0)
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
      expect(user.admin?).to be_falsey
    end
  end

  context "attributes" do
    it "is valid with all attributes" do
      user = User.create(username: "steve",
      email: "test",
      password: "pass")

      expect(user).to be_valid
    end

    it "is invalid with missing attribs" do
      user = User.create(username: "steve",
      email: "test",
      password: "")

      expect(user).to_not be_valid
    end
  end

  context "relationships" do
    # it "user has many favorites" do
    #   user = User.create(username: "steve",
    #   email: "test",
    #   password: "pass")
    #
    #   expect(user).to respond_to(:favorites)
    # end

    it "user has many gifs" do
      user = User.create(username: "steve",
      email: "test",
      password: "pass")

      expect(user).to respond_to(:gifs)
    end
  end
end
