class CreateMemorials < ActiveRecord::Migration
  def self.up
    create_table :memorials do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.integer :parent_id

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :memorials
  end
end
