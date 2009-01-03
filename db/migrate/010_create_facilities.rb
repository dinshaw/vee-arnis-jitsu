class CreateFacilities < ActiveRecord::Migration
  def self.up
    create_table :facilities do |t|
      t.string :title
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.integer :position

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :facilities
  end
end
