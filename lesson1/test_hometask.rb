require 'test/unit'
require 'selenium-webdriver'
require_relative '1_module_registration'
require_relative '3_module_login_user'
require_relative '4_module_change_password'
require_relative '5_module_create_project'
require_relative '6_module_adding_another_user'
require_relative '9_Module_issues'

class Hometask < Test::Unit::TestCase
  include Module_registration
  include Module_login
  include Module_change_password
  include Module_create_project
  include Module_adding_another_user
  include Module_issues

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_1_registration
    registration


    expected_text = 'Ваша учётная запись активирована. Вы можете войти.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_2_logout
    registration
    @driver.find_element(class: 'logout').click


    login_text = 'Войти'
    login_button = @driver.find_element(:class,'login')
    assert(login_button.displayed?)
    act_text = @driver.find_element(:class,'login').text
    assert_equal(login_text, act_text)
  end

  def test_3_login_user
    registration
    @driver.find_element(class: 'logout').click
    login


    suc_login = @driver.find_element(:id, 'loggedas')
    assert(suc_login.displayed?)
  end

  def test_4_change_password
    registration
    @driver.find_element(:class, 'icon-passwd').click
    change_password


    expected_text = 'Password was successfully updated.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_5_create_project
    registration
    create_project


    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert_equal(expected_text, actual_text)
  end

  def test_6_adding_another_user
    registration
    create_project
    adding_another_user


    expected_text = 'Successful creation.'
    actual_text = @driver.find_element(:id, 'flash_notice').text
    assert(expected_text, actual_text)
  end

  def test_7_editing_users_roles
    registration
    create_project
    adding_another_user

    sleep 1
    @driver.find_element(:css, '.odd.member .icon-edit').click
    @driver.find_element(:css, '.roles input[name ^= membership][value="3"]').click
    @driver.find_element(:css, '.roles input[name = "membership[role_ids][]"][value="4"]').click
    @driver.find_element(:css, '.roles .small').click

    expected_result = 'Developer'
    actual_result = @driver.find_element(:css, '.even.member .roles').text
    assert(expected_result,actual_result)

  end


  def test_8_project_version
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

  def test_9_issues
    registration
    create_project
    @driver.find_element(:class, 'new-issue').click
    issues
    @driver.find_element(:css, '#main-menu .issues').click


    support_1 = @driver.find_element(:css, '.hascontextmenu.odd.issue.tracker-3').find_element(:css, '.subject a')
    assert(support_1.displayed?)

    feature_1 = @driver.find_element(:css, '.hascontextmenu.even.issue.tracker-2').find_element(:css, '.subject a')
    assert(feature_1.displayed?)

    bug_1 = @driver.find_element(:css, '.hascontextmenu.odd.issue.tracker-1').find_element(:css, '.subject a')
    assert(bug_1.displayed?)

  end

  #def teardown
    #@driver.quit
  #end

end