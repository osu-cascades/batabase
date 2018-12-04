require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'support/factory_bot'
require 'capybara/rails'
require 'capybara/rspec'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

  # Heroku build packs need to put the chromedriver binary in a non-standard location specified by GOOGLE_CHROME_SHIM
  chrome_bin = ENV.fetch('GOOGLE_CHROME_SHIM', nil)

  options = {}
  options[:args] = ['headless', 'disable-gpu', 'window-size=1280,1024']
  options[:binary] = chrome_bin if chrome_bin

  Capybara.register_driver :headless_chrome do |app|
    Capybara::Selenium::Driver.new(app,
       browser: :chrome,
       options: Selenium::WebDriver::Chrome::Options.new(options)
     )
  end

  Capybara.javascript_driver = :headless_chrome
