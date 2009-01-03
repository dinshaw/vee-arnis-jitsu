class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.text :caption
      t.string :url
      t.integer :position
      t.integer :parent_id
      t.integer :photo_category_id
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
