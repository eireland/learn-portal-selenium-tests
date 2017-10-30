require './learn_component_objects/portal_main_object.rb'
require './portal_pages_object.rb'

url = "https://learn.concord.org/search"
$test_screenshot_dir = "#{Dir.home}/Sites/learn_material_screenshot_results/test_screenshots/"
# $test_screenshot_dir = "./test_screenshots/"

`rm -rf #{$test_screenshot_dir}`
`mkdir -p #{$test_screenshot_dir}`

def verify_materials(ksearch)
  page_num=1
  want_num=1 #change want_num to desired page number
  while page_num<want_num
    sleep(3)
    ksearch.next_page
    page_num +=1
  end

  puts "page num is #{page_num}"
  # 1. Check to see how many pages there are? to know how many times to click on Next button (to get number of listings xpath = //*[@id="offering_list"]/p/span/text()), there are 10 listing per page.
  sleep(3)
  last_num_pages = ksearch.get_num_pages
  puts "num of pages is #{last_num_pages}"
  while page_num <= last_num_pages
    puts "page num is #{page_num}"
    material_num=0
    # 2. Get a list of Preview buttons, and click it that many times css: '.button' with 'Preview' text
    num_materials = ksearch.get_num_material
    material_titles = ksearch.get_material_names
    puts "num materials length is #{num_materials.length}"
    while material_num <=num_materials.length - 1
      puts "material num is #{material_num}"
      (num_materials[material_num]).click
      sleep(3)
      # 3. For every preview, take a screenshot just to make sure page loads correctly.
      tab_handles=ksearch.get_tab_handles
      ksearch.switch_to_tab(tab_handles[1])
      sleep(3)
      doc_title = material_titles[material_num]
      ksearch.save_screenshot($test_screenshot_dir, doc_title) # Take screenshot
      ksearch.close_tab(tab_handles[1])
      ksearch.switch_to_tab(tab_handles[0])
      sleep(3)
      material_num +=1
    end
    sleep(3)
    if page_num<last_num_pages
      ksearch.next_page
      sleep(2)
    end
    page_num +=1
  end

end


portal = PortalPagesObject.new()
portal.setup_one(:chrome)
portal.manage_window_size
portal.visit(url)
sleep(5)

# click on Runs in Browser to only load online material vs. download id='#runs_in_browser'
portal.click_on_filter('run in browser')
sleep(2)
# click on sequence filter to simplify how many materials are on each page id='#investigation'
portal.click_on_filter('sequence')
sleep(2)
verify_materials(portal)
# unclick sequence filter
portal.click_on_filter('sequence')
# click on activities filter
sleep(2)
portal.click_on_filter('activity')
sleep(2)
verify_materials(portal)
# unclick activities filters
portal.click_on_filter('activity')
sleep(2)
# click interactives
portal.click_on_filter('interactive')
sleep(2)
verify_materials(portal)
# teardown browser
