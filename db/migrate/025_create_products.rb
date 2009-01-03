class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.string :sub_title      
      t.text :description
      t.integer :position
      t.integer :parent_id      
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :store_category_id
      t.string :video_file_path

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
