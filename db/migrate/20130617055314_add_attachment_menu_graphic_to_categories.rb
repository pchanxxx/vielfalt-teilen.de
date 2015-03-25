class AddAttachmentMenuGraphicToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :menu_graphic
    end
  end

  def self.down
    drop_attached_file :categories, :menu_graphic
  end
end
