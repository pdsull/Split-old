class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :username
      t.string    :email
      t.string    :time_zone
      t.string    :crypted_password
      t.string    :password_salt
      t.string    :persistence_token
      t.datetime  :last_login_at
      t.integer   :family_id
      t.datetime  :last_request_at
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
