class Activity < ApplicationRecord
    has_many :user_activities
    has_many :users, through: :activities
    has_many :user_activity_logs, through: :user_activities
end
