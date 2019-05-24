require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'user can see all public tasks' do
    get tasks_url
    assert_response :success
  end
end
