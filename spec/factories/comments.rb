FactoryGirl.define do
  factory :comment do
    user_id 1
    project_id 1
    text Faker::ChuckNorris.fact
  end

end
