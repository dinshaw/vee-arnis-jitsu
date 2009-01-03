class CreateSelectOptions < ActiveRecord::Migration
  def self.up
    create_table :select_options do |t|
      t.string :type
      t.string :display_name
      t.string :select_option_value
      t.integer :parent_id, :default => 0
      t.integer :position
      t.text :description

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :select_options
  end
end
