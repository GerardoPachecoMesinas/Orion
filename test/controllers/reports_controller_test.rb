require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get monthly_income_report" do
    get reports_monthly_income_report_url
    assert_response :success
  end
end
