require 'test_helper'

class UserActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_action = user_actions(:one)
  end

  test "should get index" do
    get user_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_action_url
    assert_response :success
  end

  test "should create user_action" do
    assert_difference('UserAction.count') do
      post user_actions_url, params: { user_action: {  } }
    end

    assert_redirected_to user_action_url(UserAction.last)
  end

  test "should show user_action" do
    get user_action_url(@user_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_action_url(@user_action)
    assert_response :success
  end

  test "should update user_action" do
    patch user_action_url(@user_action), params: { user_action: {  } }
    assert_redirected_to user_action_url(@user_action)
  end

  test "should destroy user_action" do
    assert_difference('UserAction.count', -1) do
      delete user_action_url(@user_action)
    end

    assert_redirected_to user_actions_url
  end
end
