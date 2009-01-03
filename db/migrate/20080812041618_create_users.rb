class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.string :first_name, :limit => 100
      t.string :last_name, :limit => 100
      t.string :phone, :limit => 100
      t.string :email, :limit => 100
      t.string :crypted_password, :limit => 40
      t.string :salt, :limit => 40
      t.string :remember_token, :limit => 40
      t.datetime :remember_token_expires_at
      t.string :activation_code, :limit => 40
      t.string :reset_code, :limit => 40      
      t.datetime :activated_at
      t.string :state, :null => :no, :default => 'passive'
      t.datetime :deleted_at
      t.timestamps
      t.userstamps
    end
    add_index :users, :email, :unique => true
    
    # admin password is 'adminadmin'
    execute "INSERT into users (email, first_name, last_name, phone, crypted_password, salt, activated_at, state) values ('admin@example.com', 'Administrative', 'User', '1231231234', 'b734de38146e0f656727ba5a0db5614e08a1d800', 'ccddfcbe6e0bb54c9ba988b74064c71721faf438','#{Time.now.to_s(:db)}','activated');"
  end

  def self.down
    drop_table "users"
  end
end