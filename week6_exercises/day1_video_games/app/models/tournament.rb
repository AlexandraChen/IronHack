class Tournament < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :registrations, dependent: :destroy
	has_many :players, through: :registrations
end
