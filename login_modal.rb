module LoginModalObject
  LOGIN_MODAL = {id: 'log-in'}
  USERNAME = {name: 'user[login]'}
  PASSWORD = {xpath: '//*[@id="log-in"]/div[1]/form/dl/dd[2]/input'}
  CLOSE_MODAL = {class: 'close'}
  #log-in > div.col-50.left > form > dl > dd:nth-child(2) > input

  def login(username,password)
    puts "in login"
    sleep(2)
    switch_to_active_modal
    login_modal = find(LOGIN_MODAL)
    puts ("login_modal is #{login_modal}")
    find(USERNAME)
    type(USERNAME, username)
    password_field = find(PASSWORD)
    type(PASSWORD, password)
    password_field.submit()
    sleep(4)
  end

  def close_login
    puts 'In login dialog'
    click_button('close_login')
  end
end