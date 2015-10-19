class RemoveIndex < ActiveRecord::Migration
  def change
    remove_index :categories_events, [:category_id, :event_id]
  end
end
