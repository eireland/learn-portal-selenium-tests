require 'selenium-webdriver'
require './portal_pages_object.rb'

REGISTER_MODAL_HEADER = {css: '#signup-default-modal > div > div > h2 > strong'}

url = 'https://learn.staging.concord.org'
teacher_name = 'ETeacher'
teacher_password = 'ETeacher'
student_name = 'rtyler'
student_password = 'tardis'
admin_name = 'ETestadmin'
admin_password = 'ETestadmin'

learn = PortalPagesObject.new()
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
learn.click_button('login')
learn.login(admin_name,admin_password)
sleep(2)
if learn.verify_auth_user('admin')
  puts "auth user verified"
else
  puts "auth not verified"
end
sleep(2)
learn.logout
sleep(2)
learn.click_button('register')
learn.switch_to_modal()
modal_header = learn.find(REGISTER_MODAL_HEADER).text
puts "header is #{modal_header}"
sleep(3)
learn.close_modal
