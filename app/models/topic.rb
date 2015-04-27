class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :favoriters ,through: :favorites , source: :user
end
