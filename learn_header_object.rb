module LearnHeaderObject
  WELCOME_TEXT = {css: '.welcome-box>table>tbody>tr>td>b'}
  LOGOUT = {xpath: "//li[contains(@class,'portal-pages-main-nav-item')]/a[contains(@title,'Log Out')]"}
  LOGOUT_SUCCESS = {xpath: '//div[(@class="flash notice") and contains(text(),"Signed out successfully")]'}

  LOGIN_BUTTON = {css: '.portal-pages-main-nav-item > .log-in'}
  REGISTER_BUTTON = {css: '.portal-pages-main-nav-item > .register'}
  COLLECTION_LINK = {css: '.portal-pages-main-nav-collections'}
  ABOUT_LINK = {css: '.portal-pages-main-nav-about'}
  SRF_HOME_LINK = {css: '.concord-logo'}

  SRF_HEADER = {xpath: '//h1[contains(text(),"Interactive STEM activities")]'}

  def verify_auth_user(user)
    puts "In verify_auth_user"
    text = text_of(WELCOME_TEXT)
    puts "text is #{text}"
    case user
      when 'admin'
        text.include? 'Admin'
        return true
      when 'teacher'
        text.include? 'Teacher'
        return true
      when 'project'
        text.include? 'Project'
        return true
      when 'researcher'
        text.include? 'Researcher'
        return true
      when 'author'
        text.include? 'Author'
        return true
      when 'student'
        text.include? 'Tyler'
        return true
      else
        return false
    end
  end

  def logout
    click_on(LOGOUT)
    sign_out = find(LOGOUT_SUCCESS)
    wait_for {displayed? LOGOUT_SUCCESS}
    if displayed? LOGOUT_SUCCESS
      puts "Sign out successful"
    else
      puts "Sign out did not happen"
    end
  end

  def verify_user_menu(user)
    nav_bar_list = find_all(TOP_NAV_BAR_LIST)
    case user
      when 'admin'
        menu = ['MY CLASSES','SEARCH','ADMIN','COLLECTIONS▶','ABOUT','HELP','']
      when 'teacher'
        menu = ['MY CLASSES','SEARCH','COLLECTIONS▶','ABOUT','HELP','']
      when 'project'
        menu = ['MY CLASSES','SEARCH','ADMIN','COLLECTIONS▶','ABOUT','HELP','']
      when 'researcher'
        menu = ['MY CLASSES','SEARCH','ADMIN','COLLECTIONS▶','ABOUT','HELP','']
      when 'author'
        menu = ['MY CLASSES','SEARCH','COLLECTIONS▶','ABOUT','HELP','']
      when 'student'
        menu = ['MY CLASSES','ABOUT']
    end

    if menu.length!=(nav_bar_list.length - 1)
      puts 'not the right number of menu items'
    end
    nav_bar_list.each do |menu_item|
      if menu.include? menu_item.text
        puts "#{menu_item.text} is correctly in the menu"
      else
        puts "#{menu_item.text} should not be in the menu"
      end
    end
  end

  def click_link(link)
    case (link)
      when "collection"
        element = COLLECTION_LINK
      when "about"
        element = ABOUT_LINK
      when "logo"
        element = SRF_HOME_LINK
    end
    wait_for {displayed? (element)}
    click_on(element)
  end

end