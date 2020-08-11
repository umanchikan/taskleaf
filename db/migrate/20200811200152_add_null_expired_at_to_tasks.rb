class AddNullExpiredAtToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :expired_at, :datetime, default: Time.current.next_month
    change_column_null :tasks, :expired_at, null: false
  end
end
