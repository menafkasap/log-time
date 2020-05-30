require 'test_helper'

class TimeLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_log = time_logs(:one)
  end

  test "should get index" do
    get time_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_time_log_url
    assert_response :success
  end

  test "should create time_log" do
    assert_difference('TimeLog.count') do
      post time_logs_url, params: { time_log: { comment: @time_log.comment, finish_time: @time_log.finish_time, time_type: @time_log.time_type, start_time: @time_log.start_time, user_id: @time_log.user_id } }
    end

    assert_redirected_to time_log_url(TimeLog.last)
  end

  test "should show time_log" do
    get time_log_url(@time_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_log_url(@time_log)
    assert_response :success
  end

  test "should update time_log" do
    patch time_log_url(@time_log), params: { time_log: { comment: @time_log.comment, finish_time: @time_log.finish_time, time_type: @time_log.time_type, start_time: @time_log.start_time, user_id: @time_log.user_id } }
    assert_redirected_to time_log_url(@time_log)
  end

  test "should destroy time_log" do
    assert_difference('TimeLog.count', -1) do
      delete time_log_url(@time_log)
    end

    assert_redirected_to time_logs_url
  end
end
