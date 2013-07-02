class Pick < ActiveRecord::Base
  
  belongs_to :pick_team, class_name: "Team", foreign_key: "pick_team_id"
  belongs_to :user
  belongs_to :game


  attr_accessible :date, :user_id, :pick_team_id
end
