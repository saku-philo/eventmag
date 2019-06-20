require 'test_helper'

class AttendsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get attends_create_url
    assert_response :success
  end

  test "should get destroy" do
    get attends_destroy_url
    assert_response :success
  end

end
