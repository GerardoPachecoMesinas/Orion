require "test_helper"

class invoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invoices_index_url
    assert_response :success
  end

  test "should get new" do
    get invoices_new_url
    assert_response :success
  end
end
