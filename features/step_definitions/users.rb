Given(/^There is an user called (.*) with uuid : (.*)$/) do |firstname_lastname_separated_by_space, uuid|
  firstname, lastname = firstname_lastname_separated_by_space.split
  @user=FactoryGirl.create(:user,
                         firstname: firstname,
                         lastname: lastname,
                         uuid: uuid)
end