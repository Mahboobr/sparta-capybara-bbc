require_relative "pages/bbc_homepage"
require_relative "pages/bbc_sign_up_page"

class BBC_Site

  def bbc_homepage
    BBC_Homepage.new
  end

  def bbc_sign_up
    BBC_Sign_Up.new
  end
end
