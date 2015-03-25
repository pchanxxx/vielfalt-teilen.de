class AddColorBottomToCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :color, :color_top
    add_column :categories, :color_bottom, :string
  end
end
