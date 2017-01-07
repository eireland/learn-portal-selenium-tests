require 'selenium-webdriver'
require './portal_main.rb'

url = 'https://learn.staging.concord.org'

def setup
  @browser_name = :chrome
  @driver = Selenium::WebDriver.for @browser_name
  @driver.manage.window.maximize
  ENV['base_url'] = 'https://learn.staging.concord.org'
rescue Exception => e
  puts e.message
  puts "Could not start driver #{@browser_name}"
  exit 1
end

def teardown
  @driver.quit
end

def run
  setup
  yield
  teardown
end

run do
  main_page = Portal_Main.new(@driver)
  main_page.click_button('signup')
  main_page.switch_to_dialog('signup')
  sleep(3)
  main_page.click_button('login')
  main_page.switch_to_dialog('login')
end