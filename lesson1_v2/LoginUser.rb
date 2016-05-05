module LoginUser
  def login
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_key 'dubinaanatolii@gmail.com'
    @driver.find_element(:id, 'password').send_key '6PE40nf9'
    @driver.find_element(:name, 'login').click
  end
end