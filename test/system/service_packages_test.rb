require "application_system_test_case"

class ServicePackagesTest < ApplicationSystemTestCase
  setup do
    @service_package = service_packages(:one)
  end

  test "visiting the index" do
    visit service_packages_url
    assert_selector "h1", text: "Service packages"
  end

  test "should create service package" do
    visit service_packages_url
    click_on "New service package"

    fill_in "Bandwidth", with: @service_package.bandwidth
    fill_in "Clasification", with: @service_package.clasification
    fill_in "Name", with: @service_package.name
    fill_in "Price", with: @service_package.price
    click_on "Create Service package"

    assert_text "Service package was successfully created"
    click_on "Back"
  end

  test "should update Service package" do
    visit service_package_url(@service_package)
    click_on "Edit this service package", match: :first

    fill_in "Bandwidth", with: @service_package.bandwidth
    fill_in "Clasification", with: @service_package.clasification
    fill_in "Name", with: @service_package.name
    fill_in "Price", with: @service_package.price
    click_on "Update Service package"

    assert_text "Service package was successfully updated"
    click_on "Back"
  end

  test "should destroy Service package" do
    visit service_package_url(@service_package)
    click_on "Destroy this service package", match: :first

    assert_text "Service package was successfully destroyed"
  end
end
