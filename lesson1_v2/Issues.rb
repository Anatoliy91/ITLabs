module Issues
  def issues
    @driver.find_element(:name, 'issue[tracker_id]').send_key 'Bug'
    @driver.find_element(:id, 'issue_subject').send_key 'Bug_1'
    @driver.find_element(:id, 'issue_status_id').send_key 'New'
    @driver.find_element(:id, 'issue_priority_id').send_key 'High'
    @driver.find_element(:name, 'continue').click
    @wait.until {@driver.find_element(:name, 'issue[tracker_id]').displayed?}
    @driver.find_element(:name, 'issue[tracker_id]').send_key 'Feature'
    @driver.find_element(:id, 'issue_subject').send_key 'Feature_1'
    @driver.find_element(:id, 'issue_status_id').send_key 'New'
    @driver.find_element(:id, 'issue_priority_id').send_key 'High'
    @driver.find_element(:name, 'continue').click
    @wait.until {@driver.find_element(:name, 'issue[tracker_id]').displayed?}
    @driver.find_element(:name, 'issue[tracker_id]').send_key 'Support'
    @driver.find_element(:id, 'issue_subject').send_key 'Support_1'
    @driver.find_element(:id, 'issue_status_id').send_key 'New'
    @driver.find_element(:id, 'issue_priority_id').send_key 'High'
    @driver.find_element(:name, 'continue').click
  end
end