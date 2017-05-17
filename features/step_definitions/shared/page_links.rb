When(/^I go to the (.*) index page$/) do |ressource_name|
  visit eval("#{ressource_name}_path")
end
