class CreateTestimonials < ActiveRecord::Migration
  def self.up
    create_table :testimonials do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.text :teaser

      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :testimonials
  end
end
