# frozen_string_literal:true

require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/poltergeist'
require 'axe/cucumber/step_definitions'

if ENV['headless']
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, window_size: [1280, 1024], js_errors: false, debug: false)
  end
  Capybara.default_driver = :poltergeist
else
  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome,
                                   :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
                                     'chromeOptions' => {
                                       'args' => [ "--window-size=1920,1080" ],
                                       'prefs' => {
                                         'download.prompt_for_download' => false,
                                         'plugins.plugins_disabled' => ["Chrome PDF Viewer"]
                                       }
                                     }
                                   )
    )
  end
  Capybara.default_driver = :selenium
end

$env = 'ToDo'
$cms = 'https://early-years-foundation-reform.herokuapp.com/users/sign_in'
$cmsuser = "temp not for repo"
$cmsp = "temp not for repo"


# - - - - - - - - -
# ToDo take values from database and create dynamic runtime variables (for now hardcoded as global variables)
#$writing1 = '/content_pages/24/edit'
@@writing1link3pos = 3
#$writing2 = '/content_pages/25/edit'
@@writing2link4pos = 4
