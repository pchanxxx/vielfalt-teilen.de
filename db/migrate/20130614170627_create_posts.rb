class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :intro
      t.text :full_text
      t.text :simple_text
      t.integer :status
      t.datetime :published_at
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
    
    add_index :posts, :category_id
    add_index :posts, :user_id
  end
end
