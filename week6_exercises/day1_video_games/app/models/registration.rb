class Registration < ActiveRecord::Base
	belongs_to :player
	belongs_to :tournament

	validates :player_id, uniqueness: {scope: :tournament_id}
end

