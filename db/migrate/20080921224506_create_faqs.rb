class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faqs do |t|
      t.string :question
      t.text :answer
      t.integer :position
      t.integer :faq_category_id

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :faqs
  end
end
