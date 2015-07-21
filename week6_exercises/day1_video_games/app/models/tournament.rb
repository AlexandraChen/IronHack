class Tournament < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :registrations
	has_many :players, through: :registration
end
