class User < ActiveRecord::Base
	has_many :products, dependent: :destroy
	has_many :reviews, dependet: :destroy
	validates :email, presence: true, uniqueness: true
	has_secure_password


end
