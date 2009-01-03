class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string :subject
      t.text :body
      t.datetime :delivered_at

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :emails
  end
end
