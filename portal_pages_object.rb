require '~/development/learn-portal-selenium-tests/base_object.rb'
require './learn_component_objects/portal_main_object.rb'
require './collection_page_object.rb'
require './about_page_object.rb'
require './search_page_object.rb'

class  PortalPagesObject < PortalMainObject
  include CollectionPageObject
  include AboutPageObject
  include HomePageObject
  include SearchPageObject

  def initialize()
    puts "Initializing"
  end

end