class CreateStaticImages < ActiveRecord::Migration
  def change
    create_table :static_images do |t|
      t.string :static_image

      t.timestamps
    end
  end
end
