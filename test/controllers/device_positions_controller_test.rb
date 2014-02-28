require 'test_helper'

class DevicePositionsControllerTest < ActionController::TestCase
  setup do
    @device_position = device_positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:device_positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device_position" do
    assert_difference('DevicePosition.count') do
      post :create, device_position: {  }
    end

    assert_redirected_to device_position_path(assigns(:device_position))
  end

  test "should show device_position" do
    get :show, id: @device_position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device_position
    assert_response :success
  end

  test "should update device_position" do
    patch :update, id: @device_position, device_position: {  }
    assert_redirected_to device_position_path(assigns(:device_position))
  end

  test "should destroy device_position" do
    assert_difference('DevicePosition.count', -1) do
      delete :destroy, id: @device_position
    end

    assert_redirected_to device_positions_path
  end
end
