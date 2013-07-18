class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :picks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def picks_count
    self.picks.count
  end

  def user_points
    point_tracker = 250
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

def full_name
  first_name + " " + last_name
end

def sort_users
  all_users = User.all

end



  # attr_accessible :title, :body

  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)
    "http://gravatar.com/avatar/#{hash}" + "?s=40&d=mm"
  end

end
