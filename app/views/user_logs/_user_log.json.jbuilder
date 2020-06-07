json.extract! user_log, :id, :comment, :logType, :startTime, :finishTime, :user_id, :created_at, :updated_at
json.url user_log_url(user_log, format: :json)
