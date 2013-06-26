class ApplicationController < ActionController::Base
  protect_from_forgery


    def ensure_admin!
	    unless current_user.admin?
	     redirect_to root_url, error: 'You do not have permission to access this url'
	    end
  	end
end
