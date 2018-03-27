require "capybara/dsl"

class BBC_Homepage
  include Capybara::DSL

  HOMEPAGE_URL = "https://www.bbc.co.uk/"
  SIGN_IN_LINK_ID = "#idcta-username"

  def visit_home
    visit(HOMEPAGE_URL)
  end

  def sign_in_link
    find(SIGN_IN_LINK_ID)
  end

  def click_sign_in
    find(SIGN_IN_LINK_ID).click
  end
end
