class AddEventsFamilyidColumn < ActiveRecord::Migration
  def self.up
    add_column :events, :family_id, :integer
  end

  def self.down
    drop_column :events, :family_id
  end
end
