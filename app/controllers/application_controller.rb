class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	protect_from_forgery with: :exception

	rescue_from CanCan::AccessDenied do |exception|
	  flash[:error] = "Access denied!"
	  redirect_to root_url
	end

	before_filter :configure_permitted_parameters, if: :devise_controller?

	protected
		def configure_permitted_parameters
		  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :email, :password, :password_confirmation, :name) }
		  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :email, :password, :password_confirmation, :name) }
		end
end
