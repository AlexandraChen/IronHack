class Comment < ActiveRecord::Base
	belongs_to :concert

	validates :comment, presence: true
	
end
