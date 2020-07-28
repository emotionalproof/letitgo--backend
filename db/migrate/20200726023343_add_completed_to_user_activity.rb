class AddCompletedToUserActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :user_activities, :completed, :boolean, default: false
  end
end
