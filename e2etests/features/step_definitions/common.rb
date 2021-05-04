Given(/an ordinary user visits the site/) do
  visit("https://help-for-early-years-providers.education.gov.uk")
end

When(/^user proceeds to "([^"]*)" page$/) do |page|
  proceed_to(page, "")
end

Then(/^page has heading "([^"]*)"$/) do |page|
  check_page_heading("h1", page)
end

And(/^page has "([^"]*)" heading "([^"]*)"$/) do |type, page|
  check_page_heading(type, page)
end

And(/^the following "([^"]*)" are available:$/) do |type, tbl|
  check_page_obj(type, tbl, "")
end

And(/^following is "([^"]*)":$/) do |func, tbl|
  process_func(func, tbl)
end

Then(/^check accessibility$/) {}

And(/^"([^"]*)" item "([^"]*)" is "([^"]*)"$/) do |list, pos, desc|
  check_one_item(list, pos, desc)
end

When(/^user proceeds to "([^"]*)" via "([^"]*)" page$/) do |func, page|
  proceed_to(page, func)
end

And(/^"([^"]*)" has value "([^"]*)"$/) do |obj, value|
  check_value_proc(obj, value)
end

Then(/^clicks on "([^"]*)"$/) do |obj|
  clk(obj)
end

When(/^on "([^"]*)" followed by "([^"]*)" tabs and click$/) do |obj, tab_cnt|
  tab_click(obj, tab_cnt)
end
