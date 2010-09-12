class AddClassNameToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :className, :string
  end

  def self.down
    remove_column :events, :className
  end
end
