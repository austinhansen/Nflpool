class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  default_scope order('points DESC')

  has_many :picks, dependent: :destroy, order: 'game_id asc'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def picks_count
    self.picks.count
  end

  def user_points
    point_tracker = 0
    self.picks.each do |pick|
      if pick.wager != nil
        if pick.result
          point_tracker = point_tracker + pick.wager
        elsif pick.result == false
          point_tracker = point_tracker - pick.wager
        end
      end
    end
    self.points = point_tracker
    self.save
    point_tracker
  end

def weekly_wagers
  wager_tracker = 0
  self.picks.each do |pick|
    if pick.wager != nil && (pick.game.date.beginning_of_week == Date.current.beginning_of_week)
        wager_tracker = wager_tracker + pick.wager
    end
  end
  if wager_tracker == nil
    0
  else
    wager_tracker
  end
end

def weekly_points
  points_tracker = 0
  self.picks.each do |pick|
    if pick.wager != nil && (pick.game.date.beginning_of_week == Date.current.beginning_of_week)
      if pick.result
        points_tracker = points_tracker + pick.wager
      elsif pick.result == false
        points_tracker = points_tracker - pick.wager
      end
    end
  end
  if points_tracker == nil
    0
  else
    points_tracker
  end
end

def last_week_wagers
  wager_tracker = 0
  self.picks.each do |pick|
    if pick.wager != nil && (pick.game.date.beginning_of_week == 1.week.ago.beginning_of_week.to_date)
        wager_tracker = wager_tracker + pick.wager
    end
  end
  if wager_tracker == nil
    0
  else
    wager_tracker
  end
end

def last_week_points
  points_tracker = 0
  self.picks.each do |pick|
    if pick.wager != nil && (pick.game.date.beginning_of_week == 1.week.ago.beginning_of_week.to_date)
      if pick.result
        points_tracker = points_tracker + pick.wager
      elsif pick.result == false
        points_tracker = points_tracker - pick.wager
      end
    end
  end
  if points_tracker == nil
    0
  else
    points_tracker
  end
end



def full_name
  first_name + " " + last_name
end

def sort_users
  all_users = User.all

end



  # attr_accessible :title, :body
end
