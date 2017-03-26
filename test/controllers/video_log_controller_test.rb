require 'test_helper'

class VideoLogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get video_log_index_url
    assert_response :success
  end

end
