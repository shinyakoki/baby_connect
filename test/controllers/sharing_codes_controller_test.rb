require "test_helper"

class SharingCodesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sharing_codes_new_url
    assert_response :success
  end
end
