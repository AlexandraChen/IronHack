class Player < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :tournaments, through: :registration
end