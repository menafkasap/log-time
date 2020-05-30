require "application_system_test_case"

class TimeLogsTest < ApplicationSystemTestCase
  setup do
    @time_log = time_logs(:one)
  end

  test "visiting the index" do
    visit time_logs_url
    assert_selector "h1", text: "Time Logs"
  end

  test "creating a Time log" do
    visit time_logs_url
    click_on "New Time Log"

    fill_in "Comment", with: @time_log.comment
    fill_in "Finish Time", with: @time_log.finish_time
    fill_in "Time Type", with: @time_log.time_type
    fill_in "Start Time", with: @time_log.start_time
    fill_in "User", with: @time_log.user_id
    click_on "Create Time log"

    assert_text "Time log was successfully created"
    click_on "Back"
  end

  test "updating a Time log" do
    visit time_logs_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @time_log.comment
    fill_in "Finish Time", with: @time_log.finish_time
    fill_in "Time Type", with: @time_log.time_type
    fill_in "Start Time", with: @time_log.start_time
    fill_in "User", with: @time_log.user_id
    click_on "Update Time log"

    assert_text "Time log was successfully updated"
    click_on "Back"
  end

  test "destroying a Time log" do
    visit time_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Time log was successfully destroyed"
  end
end
