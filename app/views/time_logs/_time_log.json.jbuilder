json.extract! time_log, :id, :comment, :time_type, :start_time, :finish_time, :user_id, :created_at, :updated_at
json.url time_log_url(time_log, format: :json)
