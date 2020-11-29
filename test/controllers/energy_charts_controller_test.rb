require 'test_helper'

class EnergyChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get by_day" do
    get energy_charts_by_day_url
    assert_response :success
  end

  test "should get by_week" do
    get energy_charts_by_week_url
    assert_response :success
  end

  test "should get by_month" do
    get energy_charts_by_month_url
    assert_response :success
  end

  test "should get by_year" do
    get energy_charts_by_year_url
    assert_response :success
  end

end
