class CreateVideoCategories < ActiveRecord::Migration
  def self.up
    create_table :video_categories do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.integer :parent_id

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :video_categories
  end
end
