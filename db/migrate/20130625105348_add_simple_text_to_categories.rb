class AddSimpleTextToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :simpletext, :text
  end
end
