class UsersController < ApplicationController
  def index
	  
  end

  def edit
    
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def destroy
    
  end
  
end
