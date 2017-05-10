Given(/^There is a project called (.*) decribed by (.*)/) do |name, description|
  FactoryGirl.create(:project, name: name, description: description)
end

Then(/^I should see a project named (.*)/) do |name|
  expect(page).to have_content(name)
end

Then(/^I should see a project described by (.*)/) do |description|
  expect(page).to have_content(description)
end