require 'test_helper'

class UserLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_log = user_logs(:one)
  end

  test "should get index" do
    get user_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_user_log_url
    assert_response :success
  end

  test "should create user_log" do
    assert_difference('UserLog.count') do
      post user_logs_url, params: { user_log: { comment: @user_log.comment, finishTime: @user_log.finishTime, logType: @user_log.logType, startTime: @user_log.startTime, user_id: @user_log.user_id } }
    end

    assert_redirected_to user_log_url(UserLog.last)
  end

  test "should show user_log" do
    get user_log_url(@user_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_log_url(@user_log)
    assert_response :success
  end

  test "should update user_log" do
    patch user_log_url(@user_log), params: { user_log: { comment: @user_log.comment, finishTime: @user_log.finishTime, logType: @user_log.logType, startTime: @user_log.startTime, user_id: @user_log.user_id } }
    assert_redirected_to user_log_url(@user_log)
  end

  test "should destroy user_log" do
    assert_difference('UserLog.count', -1) do
      delete user_log_url(@user_log)
    end

    assert_redirected_to user_logs_url
  end
end
