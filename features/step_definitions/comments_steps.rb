Given(/^There is a comment (.*) posted by (.*) for project (.*)/) do |
    content,
    firstname_lastname_separated_by_space,
    project_name|

    firstname, lastname = firstname_lastname_separated_by_space.split
    user = User.find_by(firstname: firstname, lastname: lastname)
    project = Project.find_by(name: project_name)

    FactoryGirl.create(:comment,
                       text: content,
                       user_id: user.id,
                       project_id: project.id)
end

Then(/^I should see a comment containing (.*)/) do |content|
  expect(page).to have_content(content)
end