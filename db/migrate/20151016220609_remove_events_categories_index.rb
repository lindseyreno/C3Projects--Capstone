class RemoveEventsCategoriesIndex < ActiveRecord::Migration
  def change
    remove_index :categories_events, [:event_id, :category_id]
  end
end
