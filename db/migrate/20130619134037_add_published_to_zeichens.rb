class AddPublishedToZeichens < ActiveRecord::Migration
  def change
    add_column :zeichens, :published, :boolean, default: false
  end
end
