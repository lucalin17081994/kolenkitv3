require "application_system_test_case"

class ProductSaucesTest < ApplicationSystemTestCase
  setup do
    @product_sauce = product_sauces(:one)
  end

  test "visiting the index" do
    visit product_sauces_url
    assert_selector "h1", text: "Product Sauces"
  end

  test "creating a Product sauce" do
    visit product_sauces_url
    click_on "New Product Sauce"

    fill_in "Product", with: @product_sauce.product_id
    fill_in "Sauce", with: @product_sauce.sauce_id
    click_on "Create Product sauce"

    assert_text "Product sauce was successfully created"
    click_on "Back"
  end

  test "updating a Product sauce" do
    visit product_sauces_url
    click_on "Edit", match: :first

    fill_in "Product", with: @product_sauce.product_id
    fill_in "Sauce", with: @product_sauce.sauce_id
    click_on "Update Product sauce"

    assert_text "Product sauce was successfully updated"
    click_on "Back"
  end

  test "destroying a Product sauce" do
    visit product_sauces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product sauce was successfully destroyed"
  end
end
