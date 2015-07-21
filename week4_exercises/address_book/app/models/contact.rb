class Contact < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
	validates :address, presence: true, length: { maximum: 100 }
	validates :phone1, presence: true, length: { maximum: 20 }
	validates :phone2, length: { maximum: 20 }
	validates :email1, presence: true #format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	#validates :email2 #format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
