class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string :title
      t.text :body
      
      t.integer :position
      t.string :attachee_type
      t.integer :attachee_id
      t.string :attachment_type

      t.integer :size           # file size in bytes
      t.string  :content_type   # mime type, ex: application/mp3
      t.string  :filename       # sanitized filename
      t.integer :height         # in pixels
      t.integer :width          # in pixels
      t.integer :parent_id      # id of parent image (on the same table, a self-referencing foreign-key).
      t.string  :thumbnail      # the 'type' of thumbnail this at
      
      t.timestamps
      t.userstamps      
    end
  end

  def self.down
    drop_table :attachments
  end
end
