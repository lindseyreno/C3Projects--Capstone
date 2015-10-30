class RemoveAccountActivation < ActiveRecord::Migration
  def change
    remove_column :users, :activated, :boolean, default: false
    remove_column :users, :activation_digest, :text
    remove_column :users, :activated_at, :datetime
  end
end
