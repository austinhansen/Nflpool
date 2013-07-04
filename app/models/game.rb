class Game < ActiveRecord::Base
	belongs_to :team_one, class_name: "Team", foreign_key: "team_one_id"
	belongs_to :team_two, class_name: "Team", foreign_key: "team_two_id"
	belongs_to :winning_team, class_name: "Team", foreign_key: "winning_team_id"
	has_many :picks

end
