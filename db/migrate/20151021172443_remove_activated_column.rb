class RemoveActivatedColumn < ActiveRecord::Migration
  def change
    remove_column :users, :activated
  end
end
