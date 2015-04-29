class AdminpanelsController < ApplicationController
	before_action :authenticate_user!
  def index
  	 if current_user.admin? 
  		@users=User.order(:created_at)
  	else
  		redirect_to root_path
  	end
   end
end

