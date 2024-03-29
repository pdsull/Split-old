class FamiliesController < ApplicationController
  
  before_filter :require_user
  layout 'nifty'
  
  def new
    @family = Family.new
  end
  
  def create
    @family = Family.new(params[:family])
    if @family.save
      flash[:notice] = "Successfully created family."
      redirect_to @family
    else
      render :action => 'new'
    end
  end
  
  def edit
    @family = Family.find(params[:id])
  end
  
  def update
    @family = Family.find(params[:id])
    if @family.update_attributes(params[:family])
      flash[:notice] = "Successfully updated family."
      redirect_to @family
    else
      render :action => 'edit'
    end
  end
  
  def index
    @families = Family.all
  end
  
  def show
    @family = Family.find(params[:id])
  end
end
