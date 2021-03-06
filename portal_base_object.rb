require 'selenium-webdriver'
require 'rspec/expectations'
include RSpec::Matchers
# require './LogReporter'

class PortalBaseObject

  def setup_one(browser)
    @@driver = Selenium::WebDriver.for browser
  rescue Exception => e
    puts e.message
    puts "Could not start driver #{@@driver}"
    exit
  end

  def setup_caps(platform, browser)
    puts "In setup_caps #{platform}, #{browser}"
    caps = Selenium::WebDriver::Remote::Capabilities.new
    if browser == "iPad"
      caps['appiumVersion'] = '1.6.3'
      caps['deviceName'] = 'iPad Simulator'
      caps['platformName'] = 'iOS'
      caps['platformVersion'] = '9.3'
      caps['deviceOrientation'] = 'landscape'
      caps['browserName'] = 'Safari'
      caps['rotatable'] = true
    elsif browser == "Android" #Need an Android Emulator that runs Chrome instead of generic Browser
      caps['appiumVersion'] = '1.6.3'
      caps['platformName'] = 'Android'
      caps['platformVersion'] = '6.0'
      caps['browserName'] ='Chrome'
      caps['deviceName'] = 'Android Emulator'
      caps['deviceOrientation'] = 'landscape'
      caps['nativeWebScreenshot'] = true
      caps['rotatable'] = true
    else
      caps['platform'] = platform
      caps['browserName'] = browser
      caps['logging_prefs'] = {:browser => "ALL"}
    end
    puts "Caps are #{caps}"
    return caps
  end

  #does not work for tests that need to open a CODAP file
  def setup_remote(caps)
    puts "in setup_remote #{caps}"
    @@driver = Selenium::WebDriver.for(:remote,
                                       :url => "http://eireland:b64ffb1e-a71d-40db-a73c-67a8b43620b6@ondemand.saucelabs.com:80/wd/hub",
                                       :desired_capabilities => caps)
  rescue Exception => e
    puts e.message
    puts "Could not start driver #{@@driver}"
    exit
  end
  #
  # def setup_grid(caps)
  #   puts "in setup_remote #{caps}"
  #   @@driver = Selenium::WebDriver.for (
  #       :remote,
  #       :url=> 'http://localhost:4444/wd/hub',
  #       :desired_capabilities=> caps )
  # rescue Exception => e
  #   puts e.message
  #   puts "Could not start driver #{@@driver}"
  #   exit
  # end

  def teardown
    @@driver.quit
  end

  def manage_window_size
    target_size = Selenium::WebDriver::Dimension.new(1680,1050)
    @@driver.manage.window.size = target_size
  end

  def visit(url)
    puts "IN VISIT"
    @@driver.get(url)
    manage_window_size
  end

  def verify_page(title)
    puts "Page title is #{@@driver.title}"
    expect(@@driver.title).to include(title)
  end

  def get_page_title
    return @@driver.title
  end

  def find(locator)
    @@driver.find_element locator
  end

  def find_all(locator)
    @@driver.find_elements locator
  end

  def clear(locator)
    find(locator).clear
  end

  def type(locator, input)
    find(locator).send_keys input
  end

  def click_on(locator)
    find(locator).click
  end

  def hover(locator)
    @@driver.action.move_to(locator).perform
  end

  def displayed?(locator)
    @@driver.find_element(locator).displayed?
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def text_of(locator)
    find(locator).text
  end

  def title
    @@driver.title
  end

  def save_screenshot(dir,page_title)
    puts "in get_screenshot"
    file_name = page_title.gsub(/[\/\s]/, '_')
    @@driver.save_screenshot "#{dir}/#{file_name}.png"
  end

  def write_log_file(dir_path, filename)
    log = @@driver.manage.logs.get(:browser)
    messages = ""
    log.each {|item| messages += item.message + "\n"}

    if !File.exist?("#{dir_path}/#{filename}.txt")
      File.open("#{dir_path}/#{filename}.txt", "wb") do |log|
        log<< messages unless messages == ""
      end
    else
      File.open("#{dir_path}/#{filename}.txt", "a") do |log|
        log << messages unless messages == ""
      end
    end
  end

  def write_to_file(dir_path, filename, message)
    if !File.exist?("#{dir_path}/#{filename}.txt")
      File.open("#{dir_path}/#{filename}.txt", "wb") do |responses|
        responses<< message unless message == ""
      end
    else
      File.open("#{dir_path}/#{filename}.txt", "a") do |responses|
        responses << message unless message == ""
      end
    end
  end

  def wait_for(seconds=25)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

  def pop_up_click(locator)
    puts "In pop_up_click"
    @@driver.action.click(locator).perform
  end

  def pop_up_type(locator, input)
    puts "In pop_up_type. Input is: #{input}"
    @@driver.action.send_keys(locator, input).perform
  end


  def move_to(locator)
    @@driver.action.move_to(locator).perform
  end

  def switch_to_dialog(dialog)
    puts "In switch to dialog"
    @@driver.switch_to.alert()
  end

  def switch_to_iframe(locator)
    puts "In switch to iframe"
    @@driver.switch_to.frame(locator)
  end

  def get_tab_handles
    return @@driver.window_handles
  end

  def switch_to_tab(handle)
    puts "in switch to tab"
    @@driver.switch_to.window(handle)
  end

  def switch_to_main()
    puts "in switch to main"
    @@driver.switch_to.default_content
  end

  def switch_to_first_tab()
    puts "in switch to first tab"
    @@driver.switch_to.window(@@driver.window_handles.first)
    window_handle = @@driver.window_handles.first
    return window_handle
  end

  def switch_to_last_tab()
    puts "in switch to last tab"
    # @@driver.action.send_keys(:control + :tab).perform
    @@driver.switch_to.window(@@driver.window_handles.last)
    window_handle = @@driver.window_handles.last
    return window_handle
  end

  def close_tab(handle)
    puts "in close tab"
    @@driver.switch_to.window(handle)
    @@driver.close
  end

end