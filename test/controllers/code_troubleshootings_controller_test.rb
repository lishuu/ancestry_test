require 'test_helper'

class CodeTroubleshootingsControllerTest < ActionController::TestCase
  setup do
    @code_troubleshooting = code_troubleshootings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:code_troubleshootings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create code_troubleshooting" do
    assert_difference('CodeTroubleshooting.count') do
      post :create, code_troubleshooting: { code: @code_troubleshooting.code, name: @code_troubleshooting.name, order_num: @code_troubleshooting.order_num, shooting: @code_troubleshooting.shooting, trouble_type_id: @code_troubleshooting.trouble_type_id }
    end

    assert_redirected_to code_troubleshooting_path(assigns(:code_troubleshooting))
  end

  test "should show code_troubleshooting" do
    get :show, id: @code_troubleshooting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @code_troubleshooting
    assert_response :success
  end

  test "should update code_troubleshooting" do
    patch :update, id: @code_troubleshooting, code_troubleshooting: { code: @code_troubleshooting.code, name: @code_troubleshooting.name, order_num: @code_troubleshooting.order_num, shooting: @code_troubleshooting.shooting, trouble_type_id: @code_troubleshooting.trouble_type_id }
    assert_redirected_to code_troubleshooting_path(assigns(:code_troubleshooting))
  end

  test "should destroy code_troubleshooting" do
    assert_difference('CodeTroubleshooting.count', -1) do
      delete :destroy, id: @code_troubleshooting
    end

    assert_redirected_to code_troubleshootings_path
  end
end
