class Team < ActiveRecord::Base
	has_many :games
	has_many :picks

  attr_accessible :name
end
