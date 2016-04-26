require 'test_helper'

class InvitedFiendsControllerTest < ActionController::TestCase
  setup do
    @invited_fiend = invited_fiends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invited_fiends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invited_fiend" do
    assert_difference('InvitedFiend.count') do
      post :create, invited_fiend: { status: @invited_fiend.status }
    end

    assert_redirected_to invited_fiend_path(assigns(:invited_fiend))
  end

  test "should show invited_fiend" do
    get :show, id: @invited_fiend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invited_fiend
    assert_response :success
  end

  test "should update invited_fiend" do
    patch :update, id: @invited_fiend, invited_fiend: { status: @invited_fiend.status }
    assert_redirected_to invited_fiend_path(assigns(:invited_fiend))
  end

  test "should destroy invited_fiend" do
    assert_difference('InvitedFiend.count', -1) do
      delete :destroy, id: @invited_fiend
    end

    assert_redirected_to invited_fiends_path
  end
end
