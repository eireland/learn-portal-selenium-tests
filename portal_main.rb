require './base_object'
require './login_modal'
require './portal_landing_object'
require './learn_header_object'
require './collection_page_object'
require './about_page_object'
require './home_page_object'

class PortalMainObject < BaseObject
  include PortalLandingObject
  include LoginModalObject
  include LearnHeaderObject
  include CollectionPageObject
  include AboutPageObject
  include HomePageObject

  def initialize()
    puts "Initializing"
  end

  private

  def wait_for(seconds=25)
    puts "Waiting"
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

end