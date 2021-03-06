class CreateProfessors < ActiveRecord::Migration
  def self.up
    create_table :professors do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.string :name
      t.integer :parent_id      

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :professors
  end
end
