class Player < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :registrations, dependent: :destroy
	has_many :tournaments, through: :registrations
end
