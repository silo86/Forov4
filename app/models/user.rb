class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :flags
         has_many :topics
         has_many :comments
         has_many :favorites
         has_many :favorited_topics, through: :favorites, source: :topic
         has_many :flagged_comments, through: :flags , source: :comment 
  def already_favorited?(topic)
    favorited_topics.where(id: topic.id).count > 0
  end
  def already_flagged?(comment)
    flagged_comments.where(id: comment.id).count > 0
  end
end