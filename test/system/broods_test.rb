require "application_system_test_case"

class BroodsTest < ApplicationSystemTestCase
  setup do
    @brood = broods(:one)
  end

  test "visiting the index" do
    visit broods_url
    assert_selector "h1", text: "Broods"
  end

  test "creating a Brood" do
    visit broods_url
    click_on "New Brood"

    fill_in "Name", with: @brood.name
    fill_in "Price", with: @brood.price
    click_on "Create Brood"

    assert_text "Brood was successfully created"
    click_on "Back"
  end

  test "updating a Brood" do
    visit broods_url
    click_on "Edit", match: :first

    fill_in "Name", with: @brood.name
    fill_in "Price", with: @brood.price
    click_on "Update Brood"

    assert_text "Brood was successfully updated"
    click_on "Back"
  end

  test "destroying a Brood" do
    visit broods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brood was successfully destroyed"
  end
end
