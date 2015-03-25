class AddAttachmentHeaderImageToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :header_image
    end
  end

  def self.down
    drop_attached_file :categories, :header_image
  end
end
