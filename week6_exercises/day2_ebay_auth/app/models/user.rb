class User < ActiveRecord::Base
	has_many :products, dependent: :destroy
	validates :email, presence: true, uniqueness: true
	has_secure_password


end
