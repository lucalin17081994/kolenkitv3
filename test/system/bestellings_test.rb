require "application_system_test_case"

class BestellingsTest < ApplicationSystemTestCase
  setup do
    @bestelling = bestellings(:one)
  end

  test "visiting the index" do
    visit bestellings_url
    assert_selector "h1", text: "Bestellings"
  end

  test "creating a Bestelling" do
    visit bestellings_url
    click_on "New Bestelling"

    fill_in "Address", with: @bestelling.address
    fill_in "Cart", with: @bestelling.cart_id
    fill_in "Number", with: @bestelling.number
    click_on "Create Bestelling"

    assert_text "Bestelling was successfully created"
    click_on "Back"
  end

  test "updating a Bestelling" do
    visit bestellings_url
    click_on "Edit", match: :first

    fill_in "Address", with: @bestelling.address
    fill_in "Cart", with: @bestelling.cart_id
    fill_in "Number", with: @bestelling.number
    click_on "Update Bestelling"

    assert_text "Bestelling was successfully updated"
    click_on "Back"
  end

  test "destroying a Bestelling" do
    visit bestellings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bestelling was successfully destroyed"
  end
end
