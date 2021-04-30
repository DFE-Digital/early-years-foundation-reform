Given(/today is Sunday/) do
  @today = "Sunday"
end

When(/^I ask whether it's Friday yet$/) do
  pending
end

Then(/^I should be told "([^"]*)"$/) do |arg|
  pending
end

Given(/^an ordinary user$/) do
  visit("https://eyfs-test.london.cloudapps.digital")
end

When(/^user proceeds to "([^"]*)" page$/) do |page|
  proceed_to(page, "")
end
