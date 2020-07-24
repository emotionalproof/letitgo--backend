class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_many :user_activity_logs
end
