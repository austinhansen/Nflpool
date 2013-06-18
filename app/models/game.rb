class Game < ActiveRecord::Base
  attr_accessible :date, :team_one_id, :team_two_id
end
