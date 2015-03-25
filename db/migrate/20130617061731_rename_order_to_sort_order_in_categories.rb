class RenameOrderToSortOrderInCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :order, :sort_order
  end
end
