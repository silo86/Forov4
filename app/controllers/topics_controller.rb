class TopicsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]	
def create
	if current_user.admin?
		@topic = current_user.topics.build(topic_params)
		unless @topic.save
			redirect_to topics_path, notice:"no"
		end
		
		redirect_to topics_path
	else
		redirect_to topics_path
	end
end

def new
@topic = current_user.topics.build
end

def index
@topics = Topic.all
end

def show

@topic = Topic.find(params[:id])
@comment = @topic.comments.new
@comment = Comment.find(params[:id])
end



private

def topic_params
params.require(:topic).permit(:body, :title)
end

end


