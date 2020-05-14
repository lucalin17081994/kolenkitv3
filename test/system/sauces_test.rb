require "application_system_test_case"

class SaucesTest < ApplicationSystemTestCase
  setup do
    @sauce = sauces(:one)
  end

  test "visiting the index" do
    visit sauces_url
    assert_selector "h1", text: "Sauces"
  end

  test "creating a Sauce" do
    visit sauces_url
    click_on "New Sauce"

    fill_in "Name", with: @sauce.name
    fill_in "Price", with: @sauce.price
    click_on "Create Sauce"

    assert_text "Sauce was successfully created"
    click_on "Back"
  end

  test "updating a Sauce" do
    visit sauces_url
    click_on "Edit", match: :first

    fill_in "Name", with: @sauce.name
    fill_in "Price", with: @sauce.price
    click_on "Update Sauce"

    assert_text "Sauce was successfully updated"
    click_on "Back"
  end

  test "destroying a Sauce" do
    visit sauces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sauce was successfully destroyed"
  end
end
