class CreateZeichens < ActiveRecord::Migration
  def change
    create_table :zeichens do |t|
      t.string :name
      t.string :email
      t.string :picture
      t.string :text

      t.timestamps
    end
  end
end
