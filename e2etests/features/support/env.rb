# frozen_string_literal:true

require "capybara/cucumber"
require "selenium-webdriver"
require "axe/cucumber/step_definitions"

if ENV["headless"]
  Capybara.default_driver = :poltergeist
else
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, { browser: :chrome })
  end
  Capybara.default_driver = :selenium
end

APP_ENV = "https://eyfs-framework.herokuapp.com/main/Round1Version1/hub"
CMS_ENV = "https://early-years-foundation-reform.herokuapp.com/users/sign_in"
CMS_USER = "TODO"
CMS_P = "TODO"

# - - - - - - - - -
# TODO take values from database and create dynamic runtime variables (for now hardcoded)
# $writing1 = '/content_pages/24/edit'
# @@writing1link3pos = 3
WRITING1_LINK3POS = 3
# $writing2 = '/content_pages/25/edit'
# @@writing2link4pos = 4
WRITING2_LINK4POS = 4
