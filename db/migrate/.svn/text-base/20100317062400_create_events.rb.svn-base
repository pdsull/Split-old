class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.datetime :starttime, :endtime
      t.boolean :all_day, :default => false
      t.integer :user_id
      t.text    :description
      t.integer :event_series_id
      
      t.timestamps
    end
    
    add_index :events, :event_series_id
  end

  def self.down
    drop_table :events
  end
end
