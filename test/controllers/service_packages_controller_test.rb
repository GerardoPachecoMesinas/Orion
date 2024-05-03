require "test_helper"

class ServicePackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_package = service_packages(:one)
  end

  test "should get index" do
    get service_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_service_package_url
    assert_response :success
  end

  test "should create service_package" do
    assert_difference("ServicePackage.count") do
      post service_packages_url, params: { service_package: { bandwidth: @service_package.bandwidth, clasification: @service_package.clasification, name: @service_package.name, price: @service_package.price } }
    end

    assert_redirected_to service_package_url(ServicePackage.last)
  end

  test "should show service_package" do
    get service_package_url(@service_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_package_url(@service_package)
    assert_response :success
  end

  test "should update service_package" do
    patch service_package_url(@service_package), params: { service_package: { bandwidth: @service_package.bandwidth, clasification: @service_package.clasification, name: @service_package.name, price: @service_package.price } }
    assert_redirected_to service_package_url(@service_package)
  end

  test "should destroy service_package" do
    assert_difference("ServicePackage.count", -1) do
      delete service_package_url(@service_package)
    end

    assert_redirected_to service_packages_url
  end
end
