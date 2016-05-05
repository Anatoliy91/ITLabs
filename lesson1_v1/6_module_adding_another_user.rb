module Module_adding_another_user
  def adding_another_user
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:class, 'icon-add').click

    @wait.until {@driver.find_element(:class, 'autocomplete').displayed?}

    @driver.find_element(:class, 'autocomplete').send_key 'Dubina'

    sleep 2

    @driver.find_element(:css, '#principals input').click
    @driver.find_element(:css, '.roles-selection input[value="3"]').click
    @driver.find_element(:id, 'member-add-submit').click
  end
end