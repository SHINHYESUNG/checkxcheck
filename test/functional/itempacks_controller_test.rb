require 'test_helper'

class ItempacksControllerTest < ActionController::TestCase
  setup do
    @itempack = itempacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itempacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itempack" do
    assert_difference('Itempack.count') do
      post :create, itempack: {  }
    end

    assert_redirected_to itempack_path(assigns(:itempack))
  end

  test "should show itempack" do
    get :show, id: @itempack
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itempack
    assert_response :success
  end

  test "should update itempack" do
    put :update, id: @itempack, itempack: {  }
    assert_redirected_to itempack_path(assigns(:itempack))
  end

  test "should destroy itempack" do
    assert_difference('Itempack.count', -1) do
      delete :destroy, id: @itempack
    end

    assert_redirected_to itempacks_path
  end
end
