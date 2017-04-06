require 'rails_helper'

RSpec.describe User do
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
