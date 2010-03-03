Given /^I am logged in$/ do
  Given "a user exists"
  When "I go to \"login\" page"
  And "I fill in \"login\" with \"root\""
  And "I fill in \"password\" with \"root\""
  And "I press \"Log In\""
end
