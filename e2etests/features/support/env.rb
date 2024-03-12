# frozen_string_literal:true

require 'capybara/cucumber'
require 'selenium-webdriver'
require 'axe/cucumber/step_definitions'
require 'webdrivers/chromedriver'

ENV_URL = 'http://help-for-early-years-providers.education.gov.uk/'

if ENV['headless']
  Capybara.default_driver = :poltergeist
else
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, { browser: :chrome })
  end
  Capybara.default_driver = :selenium
end

ATTEMPTS = 5

HELP_FOR_EARLY_YEARS_PROVIDERS = '#main-content > div.landing-page__section--grey > div > ul'
LI_VALUES = 'li'
LEFT_PANE_MENU = 'body > div > main > div > div.govuk-grid-column-one-third.desktop-menu'
LP_LEARNING_AREAS = 'p'
MENU = 'Menu'
MOBILE_MENU = '#mobile-menu-nav'
UL_VALUES = 'ul'
PREVIOUS_PAGE = 'li.gem-c-pagination__item.gem-c-pagination__item--previous > a > span.gem-c-pagination__link-label'
NEXT_PAGE = 'li.gem-c-pagination__item.gem-c-pagination__item--next > a > span.gem-c-pagination__link-label'
