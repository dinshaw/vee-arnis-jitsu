class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.string :title
      t.text :description
      t.integer :position

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :programs
  end
end
