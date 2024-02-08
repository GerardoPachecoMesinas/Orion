require "test_helper"

class StaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get services" do
    get statics_services_url
    assert_response :success
  end

  test "should get frequent_questions" do
    get statics_frequent_questions_url
    assert_response :success
  end

  test "should get contact" do
    get statics_contact_url
    assert_response :success
  end

  test "should get about_us" do
    get statics_about_us_url
    assert_response :success
  end
end
