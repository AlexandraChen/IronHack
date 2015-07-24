class User < ActiveRecord::Base
	has_many :products, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :reviewed_products, through: :reviews, source: :product
	validates :email, presence: true, uniqueness: true
	has_secure_password


end
