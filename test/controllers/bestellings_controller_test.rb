require 'test_helper'

class BestellingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bestelling = bestellings(:one)
  end

  test "should get index" do
    get bestellings_url
    assert_response :success
  end

  test "should get new" do
    get new_bestelling_url
    assert_response :success
  end

  test "should create bestelling" do
    assert_difference('Bestelling.count') do
      post bestellings_url, params: { bestelling: { address: @bestelling.address, cart_id: @bestelling.cart_id, number: @bestelling.number } }
    end

    assert_redirected_to bestelling_url(Bestelling.last)
  end

  test "should show bestelling" do
    get bestelling_url(@bestelling)
    assert_response :success
  end

  test "should get edit" do
    get edit_bestelling_url(@bestelling)
    assert_response :success
  end

  test "should update bestelling" do
    patch bestelling_url(@bestelling), params: { bestelling: { address: @bestelling.address, cart_id: @bestelling.cart_id, number: @bestelling.number } }
    assert_redirected_to bestelling_url(@bestelling)
  end

  test "should destroy bestelling" do
    assert_difference('Bestelling.count', -1) do
      delete bestelling_url(@bestelling)
    end

    assert_redirected_to bestellings_url
  end
end
