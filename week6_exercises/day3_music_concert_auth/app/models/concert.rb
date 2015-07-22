class Concert < ActiveRecord::Base
	has_many :comments

	validates :band, presence: true, length: { maximum: 20 }
	validates :venue, presence: true, length: { maximum: 1000 }
	validates :city, presence: true, length: { maximum: 20 }
	validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ } , numericality: {:greater_than => 0} 
	validates :description, presence: true
	validates :date, presence: true

end
