class HomeController < ApplicationController
  
  before_filter :require_user, :except => [:request_reset_password, :reset, :reset_pw, :update]
  layout 'nifty'
  
  def index
    @conflict_events = Event.find(:all,
                                  :conditions => ["starttime >= ? AND family_id = ?", Time.now, current_user.family.id],
                                  :order => "starttime DESC")
  end
  
  def new_event
    @user = current_user
    @event = Event.new(:starttime => 1.hour.from_now, :endtime => 2.hour.from_now, :period => "Does not repeat")
  end
  
  def create
    @event = Event.new(params[:event])

    if @event.save
      flash[:notice] = "Successfully scheduled event"
      redirect_to root_url
    else
      flash[:error] = "The event failed to save"
      redirect_to root_url
    end
  end
  
  def show
    @event = Event.find(params[:id])
    @user = current_user
  end
  
  def edit
    @event = Event.find(params[:id])
    @user = current_user
  end
  
  def update
    @user = User.find(params[:user][:id])
    @user.update_attributes(params[:user])
    if @user.save
      flash[:notice] = "Password Successfully Updated"
      redirect_to root_url
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully deleted event."
    redirect_to root_url
  end
  
  def request_reset_password
    if current_user
      flash[:notice] = "You are already logged in."
      redirect_to root_url
    else
      if request.post?
        @user = User.find_by_email(params[:user][:email])
        if @user
          flash[:notice] = "token = #{@user.perishable_token}"
          redirect_to login_url
        else
          flash[:error] = "No user was found with that email address. Please try again."
        end
      end
      @user = User.new
    end
  end
  
  def reset
    @user = User.find_by_perishable_token(params[:id])
    flash[:error] = "Unable to locate user with this ID." unless @user
    @new_user = @user || User.new
  end
  
  def reset_pw
    @user = User.find(params[:user][:id])
    @user.update(params[:user])
    if @user.save
      flash[:notice] = "Password Successfully Updated"
      redirect_to login_url
    end
  end

end
