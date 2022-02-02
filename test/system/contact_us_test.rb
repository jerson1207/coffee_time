require "application_system_test_case"

class ContactUsTest < ApplicationSystemTestCase
  setup do
    @contact_u = contact_us(:one)
  end

  test "visiting the index" do
    visit contact_us_url
    assert_selector "h1", text: "Contact us"
  end

  test "should create contact u" do
    visit contact_us_url
    click_on "New contact u"

    fill_in "Email", with: @contact_u.email
    fill_in "Message", with: @contact_u.message
    fill_in "Name", with: @contact_u.name
    click_on "Create Contact u"

    assert_text "Contact u was successfully created"
    click_on "Back"
  end

  test "should update Contact u" do
    visit contact_u_url(@contact_u)
    click_on "Edit this contact u", match: :first

    fill_in "Email", with: @contact_u.email
    fill_in "Message", with: @contact_u.message
    fill_in "Name", with: @contact_u.name
    click_on "Update Contact u"

    assert_text "Contact u was successfully updated"
    click_on "Back"
  end

  test "should destroy Contact u" do
    visit contact_u_url(@contact_u)
    click_on "Destroy this contact u", match: :first

    assert_text "Contact u was successfully destroyed"
  end
end
