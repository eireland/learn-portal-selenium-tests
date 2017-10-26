require 'selenium-webdriver'
require './learn_component_objects/portal_main_object.rb'

url = 'https://learn.staging.concord.org'
teacher_name = 'ETeacher'
teacher_password = 'ETeacher'
student_name = 'rtyler'
student_password = 'tardis'
admin_name = 'ETestadmin'
admin_password = 'ETestadmin'
researcher_name = "KJaneway"
researcher_password = "KJaneway"


learn = PortalMainObject.new()
learn.setup_one(:chrome)
learn.visit(url)
learn.verify_page("STEM Resource Finder")
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
# if learn.verify_auth_user('student')
#   puts "auth user verified"
# else
#   puts "auth not verified"
# end
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