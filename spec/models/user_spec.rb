require 'rails_helper'


RSpec.describe User, type: :model do
  it "list has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end


end
