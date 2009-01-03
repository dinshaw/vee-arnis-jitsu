class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.integer :parent_id
      t.integer :video_category_id
      t.integer :video_id

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :videos
  end
end
