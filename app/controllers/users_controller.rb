class UsersController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:edit, :update]
  layout 'nifty'
  
  def new
    @user = User.new
  end
  
  def create
    @family = Family.create
    
    @user2 = User.new
    @user2.family_id = @family.id
    @user2.className = "momEvent"
    @user2.email = params[:user][:second_user_email]
    @user2.password = "god8you"
    @user2.password_confirmation = "god8you"
    @user2.username = params[:user][:second_user_name]
    
    @user = User.new(params[:user])
    @user.family_id = @family.id
    @user.className = "dadEvent"
    
    if @user.save && @user2.save
      flash[:notice] = "Registration Successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to :controller => :home
    else
      render :action => 'edit'
    end
  end
end
