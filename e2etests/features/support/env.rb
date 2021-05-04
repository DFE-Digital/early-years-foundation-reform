require "capybara/cucumber"
require "selenium-webdriver"
require "axe/cucumber/step_definitions"
require "webdrivers/chromedriver"

if ENV["headless"]
  Capybara.default_driver = :poltergeist
else
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, { browser: :chrome })
  end
  Capybara.default_driver = :selenium
end

APP_ENV = "http://help-for-early-years-providers.education.gov.uk/".freeze
ATTEMPTS = 5

HELP_FOR_EARLY_YEARS_PROVIDERS = "#main-content > div.landing-page__section--grey > div > ul".freeze
LI_VALUES = "li".freeze
LEFT_PANE_MENU = "body > main > div > div > nav > nav".freeze
LP_LEARNING_AREAS = "h4".freeze
PREVIOUS_PAGE = "li.gem-c-pagination__item.gem-c-pagination__item--previous > a > span.gem-c-pagination__link-label".freeze
NEXT_PAGE = "li.gem-c-pagination__item.gem-c-pagination__item--next > a > span.gem-c-pagination__link-label".freeze
