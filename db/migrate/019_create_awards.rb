class CreateAwards < ActiveRecord::Migration
  def self.up
    create_table :awards do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.integer :parent_id
      t.string :url
      t.date :date

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :awards
  end
end
