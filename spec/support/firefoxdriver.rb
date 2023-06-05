require 'selenium/webdriver'

Capybara.app_host = 'http://localhost:3010' # wybieramy port na którym capybara będzie uruchamiała przeglądarkę
Capybara.server_host = 'localhost'
Capybara.server_port = '3010' # wybieramy port

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.register_driver :headless_firefox do |app|
  opts = Selenium::WebDriver::Firefox::Options.new

  firefox_args = %w[--headless --window-size=1920,1080 --no-sandbox --disable-dev-shm-usage]
  firefox_args.each { |arg| opts.add_argument(arg) }
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: opts)
end

Capybara.configure do |config|
  driver = ENV['HEADLESS_FIREFOX'] ? :headless_firefox : :firefox

  config.javascript_driver = driver
  config.default_driver = driver
end
