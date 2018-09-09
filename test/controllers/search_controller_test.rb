require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get field" do
    get search_field_url
    assert_response :success
  end

end
