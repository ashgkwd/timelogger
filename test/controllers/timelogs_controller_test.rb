require "test_helper"

class TimelogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get timelogs_index_url
    assert_response :success
  end

  test "should get create" do
    get timelogs_create_url
    assert_response :success
  end

  test "should get edit" do
    get timelogs_edit_url
    assert_response :success
  end

  test "should get update" do
    get timelogs_update_url
    assert_response :success
  end
end
