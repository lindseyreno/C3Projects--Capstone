class AddUniqueToCategoriesEventsIndex < ActiveRecord::Migration
  def change
    add_index :categories_events, [:category_id, :event_id], unique: true
  end
end
