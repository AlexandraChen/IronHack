class Product < ActiveRecord::Base
	belongs_to :user
	has_many :bids #one bid belongs to one product
	has_many :reviews

	validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ } , numericality: {:greater_than => 0} 
	validates :title, presence: true
	validates :description, presence: true
	validates :bidding_deadline, presence: true


end
