class Admins::SessionsController < Devise::SessionsController

def index
    @admin = Admin.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin }
    end
  end

end
