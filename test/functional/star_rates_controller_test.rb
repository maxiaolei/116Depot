require 'test_helper'

class StarRatesControllerTest < ActionController::TestCase
  setup do
    @star_rate = star_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:star_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create star_rate" do
    assert_difference('StarRate.count') do
      post :create, :star_rate => @star_rate.attributes
    end

    assert_redirected_to star_rate_path(assigns(:star_rate))
  end

  test "should show star_rate" do
    get :show, :id => @star_rate.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @star_rate.to_param
    assert_response :success
  end

  test "should update star_rate" do
    put :update, :id => @star_rate.to_param, :star_rate => @star_rate.attributes
    assert_redirected_to star_rate_path(assigns(:star_rate))
  end

  test "should destroy star_rate" do
    assert_difference('StarRate.count', -1) do
      delete :destroy, :id => @star_rate.to_param
    end

    assert_redirected_to star_rates_path
  end
end
