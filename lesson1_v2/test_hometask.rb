require 'test/unit'
require 'selenium-webdriver'
require_relative 'Registration'
require_relative 'LoginUser'
require_relative 'ChangePassword'
require_relative 'CreateProject'
require_relative 'AddingAnotherUser'
require_relative 'Issues'
require_relative 'Setup'

class Hometask < Test::Unit::TestCase
  include Registration
  include LoginUser
  include ChangePassword
  include CreateProject
  include AddingAnotherUser
  include Issues
  include Setup

  def settings
    setup
  end

  def test_registration
    registration
    expected_text = 'Ваша учётная запись активирована. Вы можете войти.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_logout
    registration
    @driver.find_element(class: 'logout').click
    login_text = 'Войти'
    login_button = @driver.find_element(:class,'login')
    assert(login_button.displayed?)
    act_text = @driver.find_element(:class,'login').text
    assert_equal(login_text, act_text)
  end

  def test_login_user
    login
    suc_login = @driver.find_element(:id, 'loggedas')
    assert(suc_login.displayed?)
  end

  def test_change_password
    registration
    @driver.find_element(:class, 'icon-passwd').click
    change_password
    expected_text = 'Password was successfully updated.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_create_project
    registration
    create_project
    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_adding_another_user
    registration
    create_project
    adding_another_user
    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert(expected_text, actual_text)
  end

  def test_editing_users_roles
    registration
    create_project
    adding_another_user
    sleep 1
    #@wait.until {@driver.find_element(:css, '.odd.member .icon-edit').displayed?}
    @driver.find_element(:css, '.odd.member .icon-edit').click
    @driver.find_element(:css, '.roles input[name ^= membership][value="3"]').click
    @driver.find_element(:css, '.roles input[name = "membership[role_ids][]"][value="4"]').click
    @driver.find_element(:css, '.roles .small').click
    expected_result = 'Developer'
    actual_result = @driver.find_element(:css, '.even.member .roles').text
    assert(expected_result,actual_result)
  end

  def test_project_version
    registration
    create_project
    @driver.find_element(:id, 'tab-versions').click
    @driver.find_element(:css, '#tab-content-versions .icon').click
    @driver.find_element(:id, 'version_name').send_key 'Version_0.1'
    @driver.find_element(:name, 'commit').click
    expected_result = 'Successful creation.'
    actual_result = @driver.find_element(:id, 'flash_notice').text
    assert(expected_result, actual_result)
  end

  def test_issues
    registration
    create_project
    @driver.find_element(:class, 'new-issue').click
    issues
    @driver.find_element(:css, '#main-menu .issues').click
    assert(@driver.find_element(:link, 'Support_1').displayed?)
    assert(@driver.find_element(:link, 'Feature_1').displayed?)
    assert(@driver.find_element(:link, 'Bug_1').displayed?)
  end

  def teardown
    @driver.quit
  end

end