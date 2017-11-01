require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'

require_relative '../pages/sections'
require_relative 'helpers'


World(Helpers)
 

$browser = ENV['BROWSER']
$headless = ENV['HEADLESS']

Capybara.register_driver :selenium do |app|

    if $headless == 'true'
      args = %w(headless disable-gpu)  
    else
      args = %w(--window-size=1280,800)
    end
      

    if $browser.eql?('chrome')
      #sobe o chrome
      Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
          chromeOptions: { args: args }
        )
      )
    elsif $browser.eql?('firefox')
      Capybara::Selenium::Driver.new(
        app,
        browser: :firefox
      )
    elsif $browser.eql?('ie')
      Capybara::Selenium::Driver.new(
        app,
        browser: :internet_explorer
      )
    end

end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = 'https://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 5