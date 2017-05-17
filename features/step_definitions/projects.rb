Given(/^There is a project called (.*) decribed by (.*)/) do |name, description|
  FactoryGirl.create(:project, name: name, description: description)
end

Given(/^User called (.*) created a project called (.*) and decribed by (.*)/) do |firstname_lastname_separated_by_space, project_name, project_description|
  firstname, lastname = firstname_lastname_separated_by_space.split
  user = User.find_by(firstname: firstname, lastname: lastname)
  FactoryGirl.create(:project,
                     name: project_name,
                     description: project_description,
                     user_id: user.id)
end

When(/^I go to the (.*) project page$/) do |name|
  project = Project.find_by(name: name)
  visit project_path(project)
end

Then(/^I should see a project named (.*)/) do |name|
  expect(page).to have_content(name)
end

Then(/^I should see a project described by (.*)/) do |description|
  expect(page).to have_content(description)
end

When(/^I click on vote (.*) first project$/) do |vote|
  find("#vote-#{vote}-1").click
end

When(/^I click on join for first project$/) do
  find("#join-1").click
end

Then(/^First project should have (.*) vote (.*)$/) do |vote_count, vote|
  expect(
      eval("Project.first.votes_#{vote}"))
      .to eq(vote_count.to_i)
end

Then(/^First project should have (.*) members$/) do |members_count|
  expect(Project.first.users.count).to eq(members_count.to_i)
end

Then(/^I (.*) voted (.*) the first project$/) do |verb, vote|
  expect( eval("@me.voted_#{vote}?(Project.first)")).to be case verb
    when "had"
      true
    when "had not"
      false
    else
      raise "You should use 'had' or 'had not'"
  end
end

Then(/^I (.*) member of the first project$/) do |verb|
  expect( Project.first.users.include?(@me)).to be case verb
    when "am"
      true
    when "am not"
      false
    else
      raise "You should use 'had' or 'had not'"
  end
end

Then(/^I should see project author name (.*)/) do |name|
  expect(page).to have_content(name)
end