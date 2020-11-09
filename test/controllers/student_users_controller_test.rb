require 'test_helper'

class StudentUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get student_users_new_url
    assert_response :success
  end

end
