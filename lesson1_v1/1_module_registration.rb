module Module_registration
  def registration
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    login = ('login' + rand(99999).to_s)
    @driver.find_element(:id, 'user_login').send_key login
    @driver.find_element(:id, 'user_password').send_key 'passworD123'
    @driver.find_element(:id, 'user_password_confirmation').send_key 'passworD123'
    @driver.find_element(:id, 'user_firstname').send_key 'Test_user'
    @driver.find_element(:id, 'user_lastname').send_key 'ITlabs'
    @driver.find_element(:id, 'user_mail').send_key (login + '@test.com')
    @driver.find_element(:id, 'user_language').send_key 'en'
    @driver.find_element(:name, 'commit').click
  end
end