class Pick < ActiveRecord::Base
  belongs_to :user_id, class_name: "User", foreign_key: "user_id"
  belongs_to :pick_team, class_name: "Team", foreign_key: "pick_team_id"

  belongs_to :games
  belongs_to :user
  attr_accessible :date, :pick_team, :user_id
end
