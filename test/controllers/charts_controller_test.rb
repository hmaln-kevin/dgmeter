require 'test_helper'

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get powers" do
    get charts_powers_url
    assert_response :success
  end

end
