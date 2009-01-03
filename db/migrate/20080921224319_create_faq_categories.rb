class CreateFaqCategories < ActiveRecord::Migration
  def self.up
    create_table :faq_categories do |t|
      t.string :title
      t.integer :position
      t.integer :parent_id
      t.text :body

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :faq_categories
  end
end
