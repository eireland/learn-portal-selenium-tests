module AboutPageObject
  ABOUT_HEADER = {xpath: '//h1[contains(text(),"About")]'}

  def verify_about_page
    wait_for {displayed? (ABOUT_HEADER)}
    return true
  end

end