require 'test_helper'

class ProductSaucesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_sauce = product_sauces(:one)
  end

  test "should get index" do
    get product_sauces_url
    assert_response :success
  end

  test "should get new" do
    get new_product_sauce_url
    assert_response :success
  end

  test "should create product_sauce" do
    assert_difference('ProductSauce.count') do
      post product_sauces_url, params: { product_sauce: { product_id: @product_sauce.product_id, sauce_id: @product_sauce.sauce_id } }
    end

    assert_redirected_to product_sauce_url(ProductSauce.last)
  end

  test "should show product_sauce" do
    get product_sauce_url(@product_sauce)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_sauce_url(@product_sauce)
    assert_response :success
  end

  test "should update product_sauce" do
    patch product_sauce_url(@product_sauce), params: { product_sauce: { product_id: @product_sauce.product_id, sauce_id: @product_sauce.sauce_id } }
    assert_redirected_to product_sauce_url(@product_sauce)
  end

  test "should destroy product_sauce" do
    assert_difference('ProductSauce.count', -1) do
      delete product_sauce_url(@product_sauce)
    end

    assert_redirected_to product_sauces_url
  end
end
