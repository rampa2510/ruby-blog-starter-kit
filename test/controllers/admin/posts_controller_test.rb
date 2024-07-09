require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_posts_show_url
    assert_response :success
  end

  test "should get approve" do
    get admin_posts_approve_url
    assert_response :success
  end

  test "should get request_changes" do
    get admin_posts_request_changes_url
    assert_response :success
  end
end
