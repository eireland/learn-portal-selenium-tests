require 'selenium-webdriver'
require './learn_component_objects/portal_main_object.rb'

REGISTER_MODAL_HEADER = {css: '#signup-default-modal > div > div > h2 > strong'}
LOGIN_MODAL_HEADER = {css: '#login-default-modal > div > form > h2 > strong'}

learn_url = 'https://learn.staging.concord.org'
admin_name='ETestadmin'
admin_password = 'ETestadmin'

  learn = PortalMainObject.new()
  # lara = LARAObject.new()
  learn.setup_one(:chrome)
  learn.visit(learn_url)
  learn.verify_page("STEM Resource Finder")
  learn.click_button('login')
  modal_header = learn.find(LOGIN_MODAL_HEADER).text
 puts "header is #{modal_header}"
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
sleep(2)
