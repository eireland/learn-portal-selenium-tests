require 'selenium-webdriver'
require './portal_main.rb'

url = 'https://learn.staging.concord.org'
teacher_name = 'ETeacher'
teacher_password = 'ETeacher'
student_name = 'rtyler'
student_password = 'tardis'
admin_name = 'ETestadmin'
admin_password = 'ETestadmin'

  learn = PortalMainObject.new()
  learn.setup_one(:chrome)
  learn.visit(url)
  learn.verify_page("STEM Resource Finder")
  puts "open collection page"
  learn.click_link('collection')
  learn.verify_collection_page
  puts "open about page"
  learn.click_link('about')
  learn.verify_about_page
  puts "open landing page"
  learn.click_link('logo')
  learn.verify_landing_page
  # learn.click_button('login')
  # learn.login(admin_name,admin_password)
# learn.click_on('signup')
# learn.switch_to_dialog('signup')
# sleep(3)
