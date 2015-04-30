class CommentsController < ApplicationController
	before_action :authenticate_user!
before_action :get_current_topic

def create
@comment = current_user.comments.create(comment_params)
@comment.topic_id = @topic.id
@comment.save
redirect_to topic_path(@topic)
end
def show
#	@comment = Comment.find(params[:comment_id])
#	@comment = Comment.find(params[:id])
end

#def flag
#@comment.flag!
#redirect_to topic_path(@topic)
#end

#def unflag
#@comment.unflag!
#redirect_to topic_path(@topic)
#end

# Por razones de seguridad es convenienete siempre traer la informacion
# asociada a una instancia en particular.
# Ejemplo:
#
# def show
# @comment = @topic.comments.find(params[:id])
# end

def new
	@comment = current_user.comments.new
end
def destroy
	@comment= Comment.find(params[:id])
	@comment.destroy
	redirect_to @topic
end

private

def get_current_topic
@topic = Topic.find(params[:topic_id])
end

def comment_params
params.require(:comment).permit(:body)
end

end

