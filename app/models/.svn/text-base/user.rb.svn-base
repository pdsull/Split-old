class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :time_zone, :second_user_name, :second_user_email
  attr_accessor :second_user_name, :second_user_email
  
  acts_as_authentic
  
  has_many :events
  belongs_to :family
  

end
