require 'rails_helper'


RSpec.describe User, type: :model do
  it "list has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "return info to display" do
    user = FactoryGirl.create(:user,
                              firstname: "John",
                              lastname: "Do",
                              avatar_url: "https://example.com/pic.jpg")
    expect(user.infos_to_display).to eq(name: "John Do", avatar_url: "https://example.com/pic.jpg")
  end
end
