require 'test_helper'

class IdelveControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get idelve_new_url
    assert_response :success
  end

end
