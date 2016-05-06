require 'test/unit'
require 'selenium-webdriver'
require_relative 'helper_methods'

class Hometask < Test::Unit::TestCase
  include HelperMethods

  def settings
    setup
  end

  def test_registration
    registration
    assert_equal('Ваша учётная запись активирована. Вы можете войти.', @driver.find_element(:id, 'flash_notice').text)
  end

  def test_logout
    registration
    @driver.find_element(class: 'logout').click
    assert_equal('Войти', @driver.find_element(:class,'login').text)
  end

  def test_login_user
    registration
    @driver.find_element(class: 'logout').click
    login
    assert(@driver.find_element(:id, 'loggedas').displayed?)
  end

  def test_change_password
    registration
    @driver.find_element(:class, 'icon-passwd').click
    change_password
    assert_equal('Password was successfully updated.', @driver.find_element(:id, 'flash_notice').text)
  end

  def test_create_project
    registration
    create_project
    assert_equal('Successful creation.', @driver.find_element(:id, 'flash_notice').text)
  end

  def test_adding_another_user
    registration
    create_project
    adding_another_user
    assert('Successful creation.', @driver.find_element(:id, 'flash_notice').text)
  end

  def test_editing_users_roles
    registration
    create_project
    adding_another_user
    sleep 1
    #@wait.until {@driver.find_element(:css, '.odd.member .icon-edit').displayed?}
    @driver.find_element(:css, '.odd.member .icon-edit').click
    @driver.find_element(:css, '.roles [value="3"]').click
    @driver.find_element(:css, '.roles [value="4"]').click
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
    assert('Successful creation.', @driver.find_element(:id, 'flash_notice').text)
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