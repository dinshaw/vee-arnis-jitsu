class CreatePhotoCategories < ActiveRecord::Migration
  def self.up
    create_table :photo_categories do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.integer :parent_id

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :photo_categories
  end
end
