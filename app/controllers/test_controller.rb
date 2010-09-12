class TestController < ApplicationController
  
  layout 'nifty'
  
  def index
    
  end
  
  def show
    @user = User.find_by_perishable_token(params[:id])
  end
  
  def add_member
    root_url if current_user
  end
  
end
