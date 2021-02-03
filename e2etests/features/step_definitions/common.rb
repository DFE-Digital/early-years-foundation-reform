# frozen_string_literal:true

Given(/^"([^"]*)" user$/) do |user|
  user_access(user)
end

When(/^user proceeds to "([^"]*)" page$/) do |page|
  proceed_to(page)
end

Then(/^page has heading "([^"]*)"$/) do |page|
  # TODO: check_page_title(page)
end

And(/^the following "([^"]*)" are available:$/) do |type, tbl|
  # TODO: check_page_obj(type, tbl, "")
end

Then(/^the following "([^"]*)" are no longer available:$/) do |type, tbl|
  # TODO: check_page_obj(type, tbl, "not")
end

And(/^following is "([^"]*)":$/) do |func, tbl|
  # TODO: process_func(func, tbl)
end

When(/^"([^"]*)" is "([^"]*)"$/) do |obj, event|
  process_event(obj, event)
end

Then(/^check accessibility$/) {}
