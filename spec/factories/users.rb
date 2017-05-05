require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    hruid { firstname.downcase.gsub(/[^a-z ]/, '')+'.'+lastname.downcase.gsub(/[^a-z ]/, '')+"."+["1950","2015","ext","soce","associe"].sample+["",".2",".3"].sample}
    # canonical_name { firstname.downcase.gsub(/[^a-z ]/, '')+'.'+lastname.downcase.gsub(/[^a-z ]/, '')}
    password Devise.friendly_token[0,20]
    password_confirmation {password}
    uuid {SecureRandom.uuid}

	  factory :admin do   
	    	role {FactoryGirl.create(:role, name:"admin")}
    end

    factory :support do
      role {FactoryGirl.create(:role, name:"support")}
    end

    factory :invalid_user do
      hruid nil
    end

    factory :user_with_addresses do
      after(:create) do |user, evaluator|
        create(:email_source_account, user: user, primary: true)
        create(:email_redirect_account, user: user)
      end
    end

  end
end
