class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
    	user_path(current_user)
  	end
  	def after_sign_up_path_for(resource)
    	root_path
  	end
  	def after_sign_out_path_for(resource)
    	root_path
  	end

	  before_action :configure_permitted_parameters, if: :devise_controller?

  	protected

  	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :age, :profession, :image, :admin])
	    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :gender, :age, :profession, :image, :admin])
	    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :age, :profession, :image, :admin])
	end
end
