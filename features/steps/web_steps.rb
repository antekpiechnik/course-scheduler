require 'uri'

When /^I go to "([^\"]*)" page$/ do |page_name|
  visit(path_to(page_name))
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )select "([^\"]*)" from "([^\"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^(?:|I )check "([^\"]*)"$/ do |field|
  check(field)
end

Then /^I should be on "([^\"]*)" page$/ do |page_name|
  path = path_to(page_name)
  assert_equal URI.parse(webrat_session.current_url).path, URI.parse(path).path
end
