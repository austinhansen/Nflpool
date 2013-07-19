class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_admin!, except: [:leaderboard, :picks]

  def index
    @users = User.scoped
  end
end