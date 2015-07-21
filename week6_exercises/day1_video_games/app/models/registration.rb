class Registration < ActiveRecord::Base
	belongs_to :player
	belongs_to :tournament

	validates :player_id, uniqueness: {scope: :tournament_id}
end


class Votership < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  validates :issue_id, :uniqueness => {:scope=>:user_id}
end