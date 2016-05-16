module HelperMethods
  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def registration
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'register').click
    @login = ('login' + rand(99999).to_s)
    @driver.find_element(:id, 'user_login').send_key @login
    @password = 'passworD123'
    @driver.find_element(:id, 'user_password').send_key @password
    @driver.find_element(:id, 'user_password_confirmation').send_key @password
    @driver.find_element(:id, 'user_firstname').send_key 'Test_user'
    @driver.find_element(:id, 'user_lastname').send_key 'ITlabs'
    @driver.find_element(:id, 'user_mail').send_key (@login + '@test.com')
    @driver.find_element(:id, 'user_language').send_key 'en'
    @driver.find_element(:name, 'commit').click
  end

  def registration_2
    @driver.find_element(:class, 'register').click
    @login = ('login' + rand(99999).to_s)
    @driver.find_element(:id, 'user_login').send_key @login
    @password = 'passworD123'
    @driver.find_element(:id, 'user_password').send_key @password
    @driver.find_element(:id, 'user_password_confirmation').send_key @password
    @driver.find_element(:id, 'user_firstname').send_key 'Test_user_2'
    @driver.find_element(:id, 'user_lastname').send_key 'ITlabs'
    @driver.find_element(:id, 'user_mail').send_key (@login + '@test.com')
    @driver.find_element(:id, 'user_language').send_key 'en'
    @driver.find_element(:name, 'commit').click
  end

  def adding_another_user
    @driver.find_element(:id, 'tab-members').click
    @driver.find_element(:class, 'icon-add').click
    @wait.until {@driver.find_element(:class, 'autocomplete').displayed?}
    @driver.find_element(:class, 'autocomplete').send_key 'Test_user'
    #sleep 2
    @wait.until {!@driver.find_element(:css, '#principals input').displayed?}
    @driver.find_element(:css, '#principals input').click
    @driver.find_element(:css, '.roles-selection [value="3"]').click
    @driver.find_element(:id, 'member-add-submit').click
  end

  def login
    @driver.navigate.to 'http://demo.redmine.org'
    @driver.find_element(:class, 'login').click
    @driver.find_element(:id, 'username').send_key @login
    @driver.find_element(:id, 'password').send_key @password
    @driver.find_element(:name, 'login').click
  end

  def change_password
    @driver.find_element(:id, 'password').send_key 'passworD123'
    @driver.find_element(:id, 'new_password').send_key 'passworD1234'
    @driver.find_element(:id, 'new_password_confirmation').send_key 'passworD1234'
    @driver.find_element(:name, 'commit').click
  end

  def create_project
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:class, 'icon-add').click
    name = ('project' + rand(99999).to_s)
    @driver.find_element(:id, 'project_name').send_key name
    @driver.find_element(:id, 'project_identifier').send_key ('test123' + name)
    @driver.find_element(:name, 'commit').click
  end

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