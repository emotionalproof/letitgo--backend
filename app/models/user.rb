class User < ApplicationRecord
    has_many :user_activities
    has_many :activities, through: :user_activities
    has_many :user_activity_logs, through: :user_activities
end
