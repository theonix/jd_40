require 'test_helper'

class LivesControllerTest < ActionController::TestCase
  setup do
    @life = lives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create life" do
    assert_difference('Life.count') do
      post :create, life: {  }
    end

    assert_redirected_to life_path(assigns(:life))
  end

  test "should show life" do
    get :show, id: @life
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @life
    assert_response :success
  end

  test "should update life" do
    patch :update, id: @life, life: {  }
    assert_redirected_to life_path(assigns(:life))
  end

  test "should destroy life" do
    assert_difference('Life.count', -1) do
      delete :destroy, id: @life
    end

    assert_redirected_to lives_path
  end
end
