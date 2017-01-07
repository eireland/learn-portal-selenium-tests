module PortalLandingObject
  LOGIN_BUTTON = {css: '#accounts > a:nth-child(2)'}
  LOGIN_MODAL = {id: 'log-in'}
  SIGN_UP_BUTTON = {css: '#accounts > a:nth-child(1)'}
  SIGNUP_MODAL = {id: 'sign-up'}
  LOGIN_MODAL_CLOSE = {css: '#log-in > a'}
  SIGNUP_MODAL_CLOSE = {css:'#sign-up > a'}
  LIFE_SCIENCE_FILTER = {id: 'life-sciences'}
  ENGINEERING_TECHNOLOGY_FILTER = {id: 'engineering-technology'}
  EARTH_SPACE_SCIENCES_FILTER = {id: 'earth-space-sciences'}
  PHYSICAL_SCIENCES_FILTER = {id: 'physical-sciences'}
  SEARCH_KEYWORD = {id: 'keyword'}
  ADVANCE_SEARCH = {id: 'advance-search-link'}
  SEARCH_BUTTON = {css: '#search > form > input.button'}
  ELEMENTARY_SCHOOL_FILTER = {id: 'elementary-school'}
  MIDDLE_SCHOOL_FILTER = {id: 'middle-school'}

  def click_button(button)
    case (button)
      when 'login'
        element = LOGIN_BUTTON
      when 'signup'
        element = SIGN_UP_BUTTON
      when 'close_login'
        element = LOGIN_MODAL_CLOSE
      when 'close_signup'
        element = SIGNUP_MODAL_CLOSE
      when 'search'
        element = SEARCH_BUTTON
    end
    wait_for {displayed? (element)}
    click_on(element)
    # verify_element(element)
  end
end

def signup
  puts 'In sign up dialog'
  click_button('close_signup')
end