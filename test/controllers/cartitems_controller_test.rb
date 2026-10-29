require "test_helper"

class CartitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cartitems_new_url
    assert_response :success
  end
end
