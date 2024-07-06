require "test_helper"

class Writer::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get writer_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get writer_posts_show_url
    assert_response :success
  end

  test "should get new" do
    get writer_posts_new_url
    assert_response :success
  end

  test "should get create" do
    get writer_posts_create_url
    assert_response :success
  end

  test "should get edit" do
    get writer_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get writer_posts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get writer_posts_destroy_url
    assert_response :success
  end

  test "should get submit" do
    get writer_posts_submit_url
    assert_response :success
  end
end
