class AddTopicsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :topics, :text
  end
end
