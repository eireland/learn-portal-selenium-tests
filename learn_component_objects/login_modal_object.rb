module LoginModalObject
  # LOGIN_MODAL = {id: 'log-in'}
  # USERNAME = {name: 'user[login]'}
  # PASSWORD = {xpath: '//*[@id="log-in"]/div[1]/form/dl/dd[2]/input'}
  # CLOSE_MODAL = {class: 'close'}
  #log-in > div.col-50.left > form > dl > dd:nth-child(2) > input

  LOGIN_BUTTON = {css: '.portal-pages-main-nav-item > .log-in'}
  REGISTER_BUTTON = {css: '.portal-pages-main-nav-item > .register'}
  LOGIN_MODAL = {id: 'login-default-modal'}
  LOGIN_MODAL_HEADER = {css: '#login-default-modal > div > form > h2 > strong'}
  LOGIN_SUBMIT_BUTTON = {css: '.login-default-modal-content > .signup-form > .submit_button-container > .submit-btn'}
  LOGIN_MODAL_GOOGLE_OPTION = {id: 'google'}
  LOGIN_MODAL_SCHOOLOGY_OPTION = {id: 'schoology'}
  LOGIN_MODAL_FORGOT_PASSWORD = {xpath: "#login-default-modal > div > form > div.submit-button-container > a"}
  USERNAME = {xpath: '//div[contains(@class,"text-input")]/input[contains(@type,"text")]'}
  PASSWORD = {xpath: '//div[contains(@class,"text-input")]/input[contains(@type,"password")]'}
  MODAL_CLOSE = {css: '.portal-pages-close'}

  def login(username,password)
    puts "in login"
    sleep(2)
    type(USERNAME, username)
    password_field = find(PASSWORD)
    type(PASSWORD, password)
    password_field.submit()
    sleep(4)
  end

  def close_modal
    puts 'In close modal'
    switch_to_main()
    click_on(MODAL_CLOSE)
  end

  def click_modal_button(button)
    case (button)
      when 'login'
        element = LOGIN_BUTTON
      when 'register'
        element = REGISTER_BUTTON
      when 'close_'
        element = MODAL_CLOSE
    end
    wait_for {displayed? (element)}
    click_on(element)
  end

end