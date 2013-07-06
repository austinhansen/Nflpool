class Pick < ActiveRecord::Base

  belongs_to :pick_team, class_name: "Team", foreign_key: "pick_team_id"
  has_one :winning_team, class_name: "Team", foreign_key: "winning_team_id",:through => :game
  belongs_to :user
  belongs_to :gameid, class_name: "Game", foreign_key: "game_id"
  belongs_to :game


end
