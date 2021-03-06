class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :update_sanitized_params, if: :devise_controller?
  	def update_sanitized_params
  		devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:first_name, :last_name, :password, :password_confirmation, :email)}
  	end
#  	def after_sign_in_path_for(user)
#  		users_path
#  	end
  protect_from_forgery with: :exception
  	rescue_from ActiveRecord::RecordNotFound do
	  #flash[:warning] = 'Resource not found.'
	  	redirect_back_or root_path
	end
	 
	def redirect_back_or(path)
	  	redirect_to request.referer || path
	end
end
