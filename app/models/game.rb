class Game < ActiveRecord::Base
	belongs_to :team_one, class_name: "Team", foreign_key: "team_one_id"
	belongs_to :team_two, class_name: "Team", foreign_key: "team_two_id"
  attr_accessible :date, :team_one_id, :team_two_id, :winning_team
end
