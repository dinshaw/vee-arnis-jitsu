class AddShippingCode < ActiveRecord::Migration
  def self.up
    change_table(:products) do |t|
      t.string :shipping_code
    end
  end

  def self.down
    change_table(:products) do |t|
      t.remove :shipping_code
    end
  end
end
