class FavoritesController < ApplicationController
	before_action :authenticate_user!
	def show
	
	end
		
	
	def update
		@topic = Topic.find(params[:id])
		
		
          type = params[:type]
          if type == "favorite"
          	current_user.favorited_topics << @topic
			redirect_to @topic, notice: "Topic Favorited!"

          elsif type == "unfavorite"
            current_user.favorited_topics.delete(@topic)
            redirect_to :back, notice: 'Topic Unfavorited'
        end
    end
	
	

end
