class CreateUserActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_activities do |t|
      t.string :date
      t.string :log
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
