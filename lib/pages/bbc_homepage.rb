require "capybara/dsl"

class BBC_Homepage
  include Capybara::DSL

  HOMEPAGE_URL = "https://www.bbc.co.uk/"
  SIGN_IN_LINK_ID = "#idcta-username"
  # SIGN_IN_LINK_ID = "#idcta-link"

  def visit_home
    visit(HOMEPAGE_URL)
  end

  def sign_in_link
    find(SIGN_IN_LINK_ID)
  end

  def click_sign_in
    # sign_in_link.click
    find(SIGN_IN_LINK_ID).click
  end
end
