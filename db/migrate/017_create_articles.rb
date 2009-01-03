class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.integer :parent_id
      t.integer :article_category_id
      t.string :published_by
      t.string :published_in
      t.date :published_at

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :articles
  end
end
