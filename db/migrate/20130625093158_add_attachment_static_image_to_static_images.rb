class AddAttachmentStaticImageToStaticImages < ActiveRecord::Migration
  def self.up
    change_table :static_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :static_images, :image
  end
end
