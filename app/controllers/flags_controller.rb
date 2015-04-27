class FlagsController < ApplicationController
	
	before_action :authenticate_user!
	def show
		@comments=Flag.where("#[current_user.id]")

	end
		
	
	def update
		@comment = Comment.find(params[:id])
		
		
          type = params[:type]
          if type == "flag"
          	current_user.flagged_comments << @comment
			redirect_to :back, notice: "comment Flagged!"

          elsif type == "unflag"
            current_user.flagged_comments.delete(@comment)
            redirect_to :back, notice: 'comment Unflagged'
        end
    end
    
	
	


end
