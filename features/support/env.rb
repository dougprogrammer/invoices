require  'capybara'
require  'capybara/cucumber'
require  'capybara/poltergeist'
require  'selenium-webdriver'
require  'rspec'
require  'site_prism'
require  'poltergeist'
require  'faker'


require_relative 'helpers'
require_relative '../pages/sections'

World[Helpers]

$browser = ENV['BROWSER ']

Capybara.register_driver :selenium do |app|
   		if $browser.eql?['chrome']
	
		Capybara::Selenium::Driver.new(
		app,	
		browser: :chrome
			desired_capabilities: Selenium::Webdriver::Remote::Capabilities.chrome(
				'chromeOption' => {
					'args' => [
						'window-size=1280,800'
					]
				}
			)
		)
		elsif $browser.eql?['firefox']
			Capybara::Selenium::Driver.new(
				app,
				browser: :firefox
			)
		elsif $browser.eql?('ie')
			Capybara::Selenium::Driver.new(
				app,
				browser: :internet_explorer
			)
		elsif $browser.eql?('headless')
			Capybara::Poltergeist::Driver.new(
				app,
				options = {
					js_errors: false
				}
			)
	end
end

Capybara.configure do |config|
	config.default_driver = :selenium
	config.app_host = 'http://ninjainvoices.herokuapp.com/'
end

Capybara.default_max_wait_time = 10

$mongo_uri = ''
Mongo::Logger.logger.level = ::Logger:FATAL

