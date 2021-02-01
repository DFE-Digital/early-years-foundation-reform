Given(/^"([^"]*)" user$/) do |user|
  useraccess(user)
end

When(/^user proceeds to "([^"]*)" page$/) do |page|
  proceedto(page)
end

Then(/^page has heading "([^"]*)"$/) do |page|
  checkpagetitle(page)
end

And(/^the following "([^"]*)" are available:$/) do |type, tbl|
  checkpageobj(type, tbl, '')
end

Then(/^the following "([^"]*)" are no longer available:$/) do |type, tbl|
  checkpageobj(type, tbl, 'not')
end

And(/^following is "([^"]*)":$/) do |func, tbl|
  processfunc(func, tbl)
end

When(/^"([^"]*)" is "([^"]*)"$/) do |obj, event|
  processevent(obj, event)
end

Then(/^check accessibility$/) do
end
