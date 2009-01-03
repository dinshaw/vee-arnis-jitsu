class CreateCmsPages < ActiveRecord::Migration
  def self.up
    create_table :cms_pages do |t|
      t.string :reference_string
      t.string :css_class
      t.string :title
      t.string :sub_title
      t.string :nav_text
      t.text :body
      
      t.text :meta_keywords
      t.text :meta_description
      
      t.integer :position
      t.integer :parent_id

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :cms_pages
  end
end
