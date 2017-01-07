require 'selenium-webdriver'
require './portal_main.rb'
require './learn_header_object.rb'

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
learn.verify_page("Learn")
learn.click_button('login')
learn.login(admin_name,admin_password)
learn.verify_user_menu('admin')
learn.logout
sleep(5)