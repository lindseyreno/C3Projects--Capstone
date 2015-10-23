class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.text :name
      t.text :description

      t.timestamps null: false
    end
  end
end
