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

APP_ENV = "https://eyfs-test.london.cloudapps.digital"
# APP_ENV = "https://eyfs-dev.london.cloudapps.digital"
ATTEMPTS = 5

HELP_FOR_EARLY_YEARS_PROVIDERS = "#main-content > div.landing-page__section--grey > div > ul"
LI_VALUES = "li"
LEFT_PANE_MENU = "body > main > div > div > nav > nav"
LP_LEARNING_AREAS = "h4"
PREVIOUS_PAGE = "li.gem-c-pagination__item.gem-c-pagination__item--previous > a > span.gem-c-pagination__link-label"
NEXT_PAGE = "li.gem-c-pagination__item.gem-c-pagination__item--next > a > span.gem-c-pagination__link-label"
