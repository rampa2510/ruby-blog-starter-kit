require "test_helper"

class WriterControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get writer_dashboard_url
    assert_response :success
  end
end
