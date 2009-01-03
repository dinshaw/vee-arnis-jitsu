class CreateTaggings < ActiveRecord::Migration
  def self.up
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :taggable_id
      t.integer :taggable_type
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :taggings
  end
end
