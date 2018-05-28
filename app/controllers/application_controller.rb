class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :set_current_user

  def set_current_user
    User.current = current_user
  end

protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:role])
		    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:role])
    end

end
