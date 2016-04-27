require 'test_helper'

class InvitedFriendsControllerTest < ActionController::TestCase
  setup do
    @invited_friend = invited_friends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invited_friends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invited_friend" do
    assert_difference('InvitedFriend.count') do
      post :create, invited_friend: { status: @invited_friend.status }
    end

    assert_redirected_to invited_friend_path(assigns(:invited_friend))
  end

  test "should show invited_friend" do
    get :show, id: @invited_friend
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invited_friend
    assert_response :success
  end

  test "should update invited_friend" do
    patch :update, id: @invited_friend, invited_friend: { status: @invited_friend.status }
    assert_redirected_to invited_friend_path(assigns(:invited_friend))
  end

  test "should destroy invited_friend" do
    assert_difference('InvitedFriend.count', -1) do
      delete :destroy, id: @invited_friend
    end

    assert_redirected_to invited_friends_path
  end
end
