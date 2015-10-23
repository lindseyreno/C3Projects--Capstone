class AddScheduleIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :schedule_id, :integer
    add_foreign_key :users, :schedules
  end
end
