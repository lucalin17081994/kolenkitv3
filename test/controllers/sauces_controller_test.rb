require 'test_helper'

class SaucesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sauce = sauces(:one)
  end

  test "should get index" do
    get sauces_url
    assert_response :success
  end

  test "should get new" do
    get new_sauce_url
    assert_response :success
  end

  test "should create sauce" do
    assert_difference('Sauce.count') do
      post sauces_url, params: { sauce: { name: @sauce.name, price: @sauce.price } }
    end

    assert_redirected_to sauce_url(Sauce.last)
  end

  test "should show sauce" do
    get sauce_url(@sauce)
    assert_response :success
  end

  test "should get edit" do
    get edit_sauce_url(@sauce)
    assert_response :success
  end

  test "should update sauce" do
    patch sauce_url(@sauce), params: { sauce: { name: @sauce.name, price: @sauce.price } }
    assert_redirected_to sauce_url(@sauce)
  end

  test "should destroy sauce" do
    assert_difference('Sauce.count', -1) do
      delete sauce_url(@sauce)
    end

    assert_redirected_to sauces_url
  end
end
