class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :date
      t.text :location
      t.text :url
      t.text :email
      t.text :description

      t.timestamps null: false
    end
  end
end
