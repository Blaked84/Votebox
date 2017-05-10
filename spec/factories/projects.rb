FactoryGirl.define do
  factory :project do
    name Faker::App.name
    description Faker::Hipster.sentence
    user_id nil
  end

end
