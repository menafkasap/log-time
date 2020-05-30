class TimeLog < ApplicationRecord
  belongs_to :user

  scope :filter_by_user_ids, -> (user_ids) { where user_id: user_ids }
  scope :filter_by_time_type, -> (time_type) { where time_type: time_type }
  scope :filter_by_start_time, -> (start_time) { where('start_time > ?', start_time) }
  scope :filter_by_finish_time, -> (finish_time) { where('finish_time < ?', finish_time) }
end
