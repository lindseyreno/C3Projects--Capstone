class AddActivationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activation_digest, :text
    add_column :users, :activated, :boolean
    add_column :users, :activated_at, :datetime
  end
end
