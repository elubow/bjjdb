require 'test_helper'

class StatsControllerTest < ActionDispatch::IntegrationTest
  test "should get site" do
    get stats_site_url
    assert_response :success
  end

end
