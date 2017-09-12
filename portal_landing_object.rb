module PortalLandingObject
  # LOGIN_BUTTON = {css: '.portal-pages-main-nav-item > .log-in'}
  # REGISTER_BUTTON = {css: '.portal-pages-main-nav-item > .register'}
  # COLLECTION_LINK = {css: '.portal-pages-main-nav-collections'}
  # ABOUT_LINK = {css: '.portal-pages-main-nav-about'}
  # SRF_HOME_LINK = {css: 'concord-logo'}

  SRF_HEADER = {xpath: '//h1[contains(text(),"Interactive STEM activities")]'}

  # LOGIN_MODAL = {id: 'login-default-modal'}
  # LOGIN_SUBMIT_BUTTON = {css: '.login-default-modal-content > .signup-form > .submit_button-container > .submit-btn'}
  # LOGIN_MODAL_GOOGLE_OPTION = {id: 'google'}
  # LOGIN_MODAL_SCHOOLOGY_OPTION = {id: 'schoology'}
  # LOGIN_MODAL_FORGOT_PASSWORD = {xpath: "#login-default-modal > div > form > div.submit-button-container > a"}
  #
  # MODAL_CLOSE = {css: '.portal-page-close'}

  SIGNUP_MODAL = {id: 'signup-default-modal'}
  SIGNUP_SUBMIT_BUTTON = {css: '.signup-default-modal-content > .signup-form > .submit_button-container > .submit-btn'}
  SIGNUP_MODAL_GOOGLE_OPTION = {id: 'google'}
  SIGNUP_MODAL_SCHOOLOGY_OPTION = {id: 'schoology'}

  LIFE_SCIENCE_FILTER = {id: 'life-sciences'}
  ENGINEERING_TECHNOLOGY_FILTER = {id: 'engineering-technology'}
  EARTH_SPACE_SCIENCES_FILTER = {id: 'earth-space-sciences'}
  PHYSICAL_SCIENCES_FILTER = {id: 'physical-sciences'}
  SEARCH_FIELD = {xpath: '//div[contains(@class,"portal-pages-search-input-container")]/input'}
  ADVANCE_SEARCH = {id: 'advance-search-link'}
  SEARCH_BUTTON = {css: '#search > form > input.button'}
  ELEMENTARY_SCHOOL_FILTER = {id: 'elementary-school'}
  MIDDLE_SCHOOL_FILTER = {id: 'middle-school'}

  # def click_button(button)
  #   case (button)
  #     when 'login'
  #       element = LOGIN_BUTTON
  #     when 'register'
  #       element = REGISTER_BUTTON
  #     when 'close_login'
  #       element = LOGIN_MODAL_CLOSE
  #     when 'close_signup'
  #       element = SIGNUP_MODAL_CLOSE
  #     when 'search'
  #       element = SEARCH_BUTTON
  #   end
  #   wait_for {displayed? (element)}
  #   click_on(element)
  #   # verify_element(element)
  # end


  # def click_link(link)
  #   case (link)
  #     when "collection"
  #       element = COLLECTION_LINK
  #     when "about"
  #       element = ABOUT_LINK
  #     when "logo"
  #       element = SRF_HOME_LINK
  #   end
  #   wait_for {displayed? (element)}
  #   click_on(element)
  # end

  def signup
    puts 'In sign up dialog'
    click_button('close_signup')
  end

  def verify_landing_page
    wait_for {displayed? (SRF_HEADER)}
    return true
  end
end



