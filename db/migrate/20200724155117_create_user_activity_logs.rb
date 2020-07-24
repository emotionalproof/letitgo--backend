class CreateUserActivityLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_activity_logs do |t|
      t.string :content
      t.string :date
      t.references :user_activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
