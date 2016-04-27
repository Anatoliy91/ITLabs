module Module_change_password
  def change_password
    @driver.find_element(:id, 'password').send_key 'passworD123'
    @driver.find_element(:id, 'new_password').send_key 'passworD1234'
    @driver.find_element(:id, 'new_password_confirmation').send_key 'passworD1234'
    @driver.find_element(:name, 'commit').click
  end
end