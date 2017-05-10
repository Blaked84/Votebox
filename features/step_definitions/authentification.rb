Given(/^I'm a registred user$/) do
  @me=FactoryGirl.create(:user,
                         email: "my_email@example.com",
                         password: "secret",
                         uuid: "559bb0aa-ddac-4607-ad41-7e520ee40819"
  )
end

And(/^I'm logged in$/) do
  visit new_user_session_path
  fill_in "user_email", :with => @me.email
  fill_in "user_password", :with => @me.password
  click_button "Log in"
end

Then(/^I should be redirected to login page$/) do
  current_path.should == new_user_session_path
end