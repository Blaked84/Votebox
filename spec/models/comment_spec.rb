require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "list has a valid factory" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:project_id) }
  it { should validate_presence_of(:text) }
end
