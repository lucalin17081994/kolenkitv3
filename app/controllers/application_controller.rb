class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :address,:number])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password, :address,:number])
        
    end

  def require_admin
    unless current_user && current_user.admin?
      flash[:notice] = "You are not an admin"
      redirect_to root_path
    end        
  end
end
