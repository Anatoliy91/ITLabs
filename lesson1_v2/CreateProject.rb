module CreateProject
  def create_project
    @driver.find_element(:class, 'projects').click
    @driver.find_element(:class, 'icon-add').click
    name = ('project' + rand(99999).to_s)
    @driver.find_element(:id, 'project_name').send_key name
    @driver.find_element(:id, 'project_identifier').send_key ('test123' + name)
    @driver.find_element(:name, 'commit').click
  end
end