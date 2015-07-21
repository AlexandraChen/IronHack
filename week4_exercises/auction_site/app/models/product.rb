class Product < ActiveRecord::Base
	belongs_to :user
	has_many :bids #one bid belongs to one product

	#validates :user_id, :presence true
	# validates :title, :presence true
	# validates :description, :presence true
	# validates :bidding_deadline, :presence true
end
