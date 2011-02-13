require 'watir-webdriver'
require 'watir-webdriver/extensions/wait'

$driver_name = ENV['WEBDRIVER'] || 'firefox'
$webdriver = Selenium::WebDriver.for $driver_name.to_sym
$browser = Watir::Browser.new $webdriver

INDEX_OFFSET = -1
WEBDRIVER = true

at_exit do
  $browser.close unless ENV['LEAVE_BROWSER_OPEN']
end

module Soluble::Pages
  class Page
    attr_reader :browser

    def initialize
      @browser = $browser
    end
  end
end
