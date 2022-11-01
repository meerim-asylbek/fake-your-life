require "test_helper"

class HireAddsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get hire_adds_create_url
    assert_response :success
  end
end
