class User < ApplicationRecord
  has_secure_password

  has_many :time_logs
  validates :email, presence: true, uniqueness: true

  def fullname
    "#{first_name} #{last_name} (##{id})"
  end
end
