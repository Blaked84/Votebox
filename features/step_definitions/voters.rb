When (/^User (.*) vote for project called (.*)/) do |firstname_lastname_separated_by_space, project_name|
  project = Project.find_by(name: project_name)
  firstname, lastname = firstname_lastname_separated_by_space.split
  user = User.find_by(firstname: firstname, lastname: lastname)
  user.vote_for(project)
end

Then(/^I should see voters as (.*)/) do |names|
  expect(page).to have_content(names)
end