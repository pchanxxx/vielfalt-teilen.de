class AddTeaserImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :teaser_image
    end
  end

  def self.down
    drop_attached_file :posts, :teaser_image
  end
end
