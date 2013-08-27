class Game < ActiveRecord::Base
	belongs_to :team_one, class_name: "Team", foreign_key: "team_one_id"
	belongs_to :team_two, class_name: "Team", foreign_key: "team_two_id"
	belongs_to :winning_team, class_name: "Team", foreign_key: "winning_team_id"
	has_many :picks

  def thursday_game
    if self.date.in_time_zone.wday == 4 && self.date > Date.current
      true
    else
      false
    end
  end

  def sunday_game
    if self.date.in_time_zone.wday == 0 && self.date.in_time_zone > 1.day.from_now
      true
    else
      false
    end
  end

  def monday_game
    if self.date.in_time_zone.wday == 1 && self.date.in_time_zone > 2.days.from_now
      true
    else
      false
    end
  end
end
