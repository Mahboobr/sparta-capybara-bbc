require "spec_helper"

describe "testing the BBC registration journey" do

  ERR_WRONG_DATE_1 = "Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
  ERR_WRONG_DATE_2 = "Oops, that month and year don't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
  ERR_WRONG_DATE_3 = "Oops, that year doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
  ERR_WRONG_DATE_4 = "Oops, that day and year don't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."
  ERR_WRONG_DATE_5 = "Oops, that day and month don't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009."

  context 'tests on date page' do
  #   before(:each) do
  #     @bbc_site = BBC_Site.new
  #     @bbc_site.bbc_homepage.visit_home
  #     @bbc_site.bbc_homepage.click_sign_in
  #     @bbc_site.bbc_sign_up.click_register_link
  #     @bbc_site.bbc_sign_up.click_over_13
  #   end
  #   context 'letters entered into fields' do
  #     it "should throw error if day, month, and year fields are left blank" do
  #       @bbc_site.bbc_sign_up.submit_button
  #       expect(@bbc_site.bbc_sign_up.date_error).to eq(ERR_WRONG_DATE_1)
  #     end
  #     it "should throw error if letter is entered in day field, and month and year fields left blank" do
  #       @bbc_site.bbc_sign_up.enter_day("a")
  #       @bbc_site.bbc_sign_up.submit_button
  #       expect(@bbc_site.bbc_sign_up.date_error).to eq(ERR_WRONG_DATE_1)
  #     end
  #     it "should throw error if letter is entered in day field and month field, and year field left blank" do
  #       @bbc_site.bbc_sign_up.enter_day("a")
  #       @bbc_site.bbc_sign_up.enter_month("b")
  #       @bbc_site.bbc_sign_up.submit_button
  #       expect(@bbc_site.bbc_sign_up.date_error).to eq(ERR_WRONG_DATE_1)
  #     end
  #     it "should throw error if letter is entered in day, month, and year fields" do
  #       @bbc_site.bbc_sign_up.enter_day("a")
  #       @bbc_site.bbc_sign_up.enter_month("b")
  #       @bbc_site.bbc_sign_up.enter_year("c")
  #       @bbc_site.bbc_sign_up.submit_button
  #       expect(@bbc_site.bbc_sign_up.date_error).to eq(ERR_WRONG_DATE_1)
  #     end
  #   end
  #   context 'valid inputs entered into fields with other empty fields remaining' do
  #     it "should throw error if day has valid input, but month and year fields are left blank" do
  #       @bbc_site.bbc_sign_up.enter_day("1")
  #       @bbc_site.bbc_sign_up.submit_button
  #       expect(@bbc_site.bbc_sign_up.date_error).to eq(ERR_WRONG_DATE_2)
  #     end
  #     it "should throw error if month has a valid input, but day and year fields are left blank" do
  #       @bbc_site.bbc_sign_up.enter_month("2")
  #       @bbc_site.bbc_sign_up.submit_button
  #       expect(@bbc_site.bbc_sign_up.date_error).to eq(ERR_WRONG_DATE_4)
  #     end
  #     it "should throw error if year has a valid input, but day and month fields are left blank" do
  #       @bbc_site.bbc_sign_up.enter_year("1990")
  #       @bbc_site.bbc_sign_up.submit_button
  #       expect(@bbc_site.bbc_sign_up.date_error).to eq(ERR_WRONG_DATE_5)
  #     end
  #   end
  #   context 'valid inputs entered into all fields' do
  #     it "should not throw error if all fields have valid input" do
  #       @bbc_site.bbc_sign_up.enter_day("1")
  #       expect(@bbc_site.bbc_sign_up.get_day_value).to be_between(1, 31).inclusive
  #       @bbc_site.bbc_sign_up.enter_month("2")
  #       expect(@bbc_site.bbc_sign_up.get_month_value).to be_between(1, 12).inclusive
  #       @bbc_site.bbc_sign_up.enter_year("1990")
  #       expect(@bbc_site.bbc_sign_up.get_year_value.length).to eq(4)
  #       @bbc_site.bbc_sign_up.submit_button
  #     end
  #   end
  end

  context 'tests on details page' do
    before(:all) do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home
      @bbc_site.bbc_homepage.click_sign_in
      @bbc_site.bbc_sign_up.click_register_link
      @bbc_site.bbc_sign_up.click_over_13
      @bbc_site.bbc_sign_up.enter_day("1")
      @bbc_site.bbc_sign_up.enter_month("2")
      @bbc_site.bbc_sign_up.enter_year("1990")
      @bbc_site.bbc_sign_up.submit_button
    end

    it "email should include @" do
      @bbc_site.bbc_sign_up.enter_new_email("capybara_test_2@live.co.uk")
      expect(@bbc_site.bbc_sign_up.get_email_value).to include("@", ".co")
    end

    it "password should be longer than 8 characters, at least one letter, and have at least one number or symbol" do
      @bbc_site.bbc_sign_up.enter_new_password("alligator12")
      expect(@bbc_site.bbc_sign_up.get_password_value.length).to be >(8)
      expect(@bbc_site.bbc_sign_up.get_password_value.split(//)).to include /["1"-"9"]+/
    end

    it "postcode should be less than 8 characters, at least one letter, and have at least one number" do
      @bbc_site.bbc_sign_up.click_postcode("IG1 2SR")
      expect(@bbc_site.bbc_sign_up.get_postcode_value.length).to be <(8)
      expect(@bbc_site.bbc_sign_up.get_postcode_value.split(//)).to include /[1-9]+/
      expect(@bbc_site.bbc_sign_up.get_postcode_value.upcase.split(//)).to include /[A-Z]+/
    end

    it "should contain one of the options listed" do
      gender_arr = ["male", "female", "other", "prefer not to say"]
      @bbc_site.bbc_sign_up.select_gender("Prefer not to say")
      expect(gender_arr).to include(@bbc_site.bbc_sign_up.get_gender_value)
    end

    it "one option should be selected" do
      # @bbc_site.bbc_sign_up.input_email_spam_choice('optOut')
      expect(@bbc_site.bbc_sign_up.input_email_spam_choice('optOut').selected?).to be false
    end

    after(:all) do
      @bbc_site.bbc_sign_up.click_register_final
      sleep 4
    end

  end

end
