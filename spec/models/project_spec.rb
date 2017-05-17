require 'rails_helper'


RSpec.describe Project, type: :model do
  it "list has a valid factory" do
    expect(FactoryGirl.build(:project)).to be_valid
  end

end
