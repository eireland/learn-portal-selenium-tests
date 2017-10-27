require './base_object'
require './learn_component_objects/portal_main_object'
require './collection_page_object'
require './about_page_object'
require './search_pages_object'

class  PortalPages < PortalMainObject
  include CollectionPageObject
  include AboutPageObject
  include HomePageObject
  include SearchPageObject

  def initialize()
    puts "Initializing"
  end

end