class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.string :slogan
      t.text :introtext
      t.string :color

      t.timestamps
    end
  end
end
