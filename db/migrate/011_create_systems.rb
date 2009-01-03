class CreateSystems < ActiveRecord::Migration
  def self.up
    create_table :systems do |t|
      t.string :title
      t.text :description
      t.integer :position

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :systems
  end
end
