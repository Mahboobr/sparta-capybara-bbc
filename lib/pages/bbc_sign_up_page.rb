require "capybara/dsl"

class BBC_Sign_Up
  include Capybara::DSL

  REGISTER_NOW = 'Register now'
  OVER_13 = '13 or over'
  DAY = "dateOfBirthDay"
  DAY_ID = "#day-input"
  MONTH = "dateOfBirthMonth"
  MONTH_ID = "#month-input"
  YEAR = "dateOfBirthYear"
  YEAR_ID = "#year-input"
  SUBMIT = "#submit-button"
  NEW_EMAIL = "email"
  EMAIL_ID = "#user-identifier-input"
  NEW_PASSWORD = "password"
  PASSWORD_ID = "#password-input"
  SHOW_PASSWORD = "Show password"
  POSTCODE = "postcode"
  POSTCODE_ID = "#postcode-input"
  GENDER = "gender"
  GENDER_ID = "#gender-input"
  OPT_IN = '//*[@id="marketingOptIn"]/div[1]/div[1]/label/div'
  OPT_OUT = '//*[@id="marketingOptIn"]/div[1]/div[2]/label/div'
  REGISTER = "Register"
  DATE_ERR_DOB = "#form-message-dateOfBirth"

  def click_register_link
    click_link(REGISTER_NOW)
  end

  def click_over_13
    click_link(OVER_13)
  end

  def enter_day(day)
    fill_in DAY, with: day
  end
  def get_day_value
    find(DAY_ID).value.to_i
  end

  def enter_month(month)
    fill_in MONTH, with: month
  end
  def get_month_value
    find(MONTH_ID).value.to_i
  end

  def enter_year(year)
    fill_in YEAR, with: year
  end
  def get_year_value
    find(YEAR_ID).value
  end

  def submit_button
    find(SUBMIT).click
  end

  def enter_new_email(new_email)
    fill_in NEW_EMAIL, with: new_email
  end
  def get_email_value
    find(EMAIL_ID).value
  end

  def enter_new_password(new_password)
    fill_in NEW_PASSWORD, with: new_password
  end
  def get_password_value
    find(PASSWORD_ID).value
  end

  def click_show_password
    click_link(SHOW_PASSWORD)
  end

  def click_postcode(postcode)
    fill_in POSTCODE, with: postcode
  end
  def get_postcode_value
    find(POSTCODE_ID).value
  end

  def select_gender(gender)
    select gender, from: GENDER
  end
  def get_gender_value
    find(GENDER_ID).value
  end

  def input_email_spam_choice(choice)
    if choice == 'optOut'
      find(:xpath, OPT_OUT).click
    elsif choice == 'optIn'
      find(:xpath, OPT_IN).click
    else
      throw
    end
  end

  def click_register_final
    click_button(REGISTER)
  end

  def date_error
    find(DATE_ERR_DOB).text
  end

end
