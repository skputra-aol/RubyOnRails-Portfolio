require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  setup do
    @registration = registrations(:one)
  end

  test "visiting the index" do
    visit registrations_url
    assert_selector "h1", text: "Registrations"
  end

  test "should create registration" do
    visit registrations_url
    click_on "New registration"

    check "Available" if @registration.available
    fill_in "Note", with: @registration.note
    fill_in "Pin", with: @registration.pin_id
    fill_in "Property", with: @registration.property_id
    fill_in "Tag no", with: @registration.tag_no
    fill_in "Vendor", with: @registration.vendor_id
    click_on "Create Registration"

    assert_text "Registration was successfully created"
    click_on "Back"
  end

  test "should update Registration" do
    visit registration_url(@registration)
    click_on "Edit this registration", match: :first

    check "Available" if @registration.available
    fill_in "Note", with: @registration.note
    fill_in "Pin", with: @registration.pin_id
    fill_in "Property", with: @registration.property_id
    fill_in "Tag no", with: @registration.tag_no
    fill_in "Vendor", with: @registration.vendor_id
    click_on "Update Registration"

    assert_text "Registration was successfully updated"
    click_on "Back"
  end

  test "should destroy Registration" do
    visit registration_url(@registration)
    click_on "Destroy this registration", match: :first

    assert_text "Registration was successfully destroyed"
  end
end
