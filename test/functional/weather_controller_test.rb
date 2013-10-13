require 'test_helper'

class WeatherControllerTest < ActionController::TestCase
  test "should get load" do
    get :load
    assert_response :success
  end

end
