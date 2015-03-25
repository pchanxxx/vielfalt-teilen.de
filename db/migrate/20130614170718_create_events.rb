class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date_start
      t.datetime :date_end
      t.string :location
      t.text :description
      t.datetime :published_at
      t.integer :user_id

      t.timestamps
    end
    add_index :events, :user_id
  end
end
