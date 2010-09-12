class Family < ActiveRecord::Base
  attr_accessible :name
  
  has_many :users
  has_many :members
  has_many :events
  
end
