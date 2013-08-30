class Pick < ActiveRecord::Base
  validates :pick_team_id, presence: { message: 'Please select a team.' }

  belongs_to :pick_team, class_name: "Team", foreign_key: "pick_team_id"
  belongs_to :user
  belongs_to :game

  def result
    if self.game.winning_team_id == nil
      nil
    else
    self.pick_team_id == self.game.winning_team_id
    end
  end

end
