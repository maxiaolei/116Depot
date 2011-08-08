require 'test_helper'

class BookInNeedsControllerTest < ActionController::TestCase
  setup do
    @book_in_need = book_in_needs(:one)
    @update = {
      :title => 'title',
      :press => 'asdfasd',
      :author => 'adfsdfasdf',
      :description => 'asdfasdfsd',
      :image_url => 'adfsdfsd.jpg'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_in_needs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_in_need" do
    assert_difference('BookInNeed.count') do
      post :create, :book_in_need => @update
    end

    assert_redirected_to book_in_need_path(assigns(:book_in_need))
  end

  test "should show book_in_need" do
    get :show, :id => @book_in_need.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @book_in_need.to_param
    assert_response :success
  end

  test "should update book_in_need" do
    put :update, :id => @book_in_need.to_param, :book_in_need => @update
    assert_redirected_to book_in_need_path(assigns(:book_in_need))
  end

  test "should destroy book_in_need" do
    assert_difference('BookInNeed.count', -1) do
      delete :destroy, :id => @book_in_need.to_param
    end

    assert_redirected_to book_in_needs_path
  end
end
