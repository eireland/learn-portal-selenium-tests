require './portal_base_object.rb'

class SearchPageObject < PortalBaseObject

  SEQUENCE_CHECKBOX = {id: 'investigation'}
  ACTIVITIES_CHECKBOX = {id: 'Activity'}
  INTERACTIVE_CHECKBOX = {id: 'Interactive'}
  RUNS_IN_BROWSER_CHCECKBOX = {id: 'runs_in_browser'}
  REQUIRES_DOWNLOAD_CHECKBOX = {id: 'requires_download'}
  TOTAL_NUM_MATERIALS = {css: '.materials_container > div:nth-child(2) > p:nth-child(1) > span:nth-child(1) > b:nth-child(2)'}
  NEXT_PAGE = {css: '.next'}
  PREVIEW_BUTTON = {xpath: '//a[contains(text(),"Preview")]'}
  MATERIAL_TITLE = {css: ".material_list_item"}

  def initialize()
    puts "Initializing"
  end

  def click_on_filter(filter)
    puts "In click on filter. filter is #{filter}"
    case (filter)
      when 'sequence'
        click_on(SEQUENCE_CHECKBOX)
      when 'activity'
        click_on(ACTIVITIES_CHECKBOX)
      when 'interactive'
        click_on(INTERACTIVE_CHECKBOX)
      when 'run in browser'
        click_on(RUNS_IN_BROWSER_CHCECKBOX)
      when 'requires download'
        click_on(REQUIRES_DOWNLOAD_CHECKBOX)
    end
  end

  def click_on_button(button)
    puts "in click on button"
    case (button)
      when "preview"
          click_on(PREVIEW_BUTTON)
    end
  end

  def get_num_pages
    puts "In get_num_pages"
    total_materials = (text_of(TOTAL_NUM_MATERIALS)).to_i
    guess_pages = total_materials/10
    if !((total_materials%10)==0)
      return num_pages = guess_pages+1
    else
      return num_pages = guess_pages
    end
  end

  def next_page
    puts "in next page"
    click_on(NEXT_PAGE)
  end

  def get_num_material #finds num of material by how many preview buttons there are
    puts "in get num material"
    num_material=find_all(PREVIEW_BUTTON)
    return num_material
  end

  def get_material_names
    puts "in get material names"
    material_titles = []
    material_locs = find_all(MATERIAL_TITLE)
    material_locs.each do |material_loc|
      material_titles.push(material_loc.attribute('data-material_name'))
    end
    return material_titles
  end

  private
  def verify_element(element)

  end


  def wait_for(seconds=25)
    puts "Waiting"
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
  end

end