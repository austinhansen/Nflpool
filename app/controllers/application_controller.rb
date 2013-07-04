class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :profile_name, :admin)}
  end

    def ensure_admin!
	    unless current_user.admin?
	     redirect_to root_url, error: 'You do not have permission to access this url'
	    end
  	end
end
