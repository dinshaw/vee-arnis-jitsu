class CreateIcalEvents < ActiveRecord::Migration
  def self.up
    create_table :ical_events do |t|
      t.datetime :stime
      t.datetime :etime
      t.string :title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :ical_events
  end
end
