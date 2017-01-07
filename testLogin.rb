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
if learn.verify_auth_user('admin')
  puts "auth user verified"
else
  puts "auth not verified"
end
learn.logout
sleep(5)
learn.click_button('login')
learn.login(student_name,student_password)
if learn.verify_auth_user('student')
  puts "auth user verified"
else
  puts "auth not verified"
end
learn.logout
sleep(5)
learn.click_button('login')
learn.login(teacher_name,teacher_password)
if learn.verify_auth_user('teacher')
  puts "auth user verified"
else
  puts "auth not verified"
end
learn.logout
sleep(5)
learn.teardown