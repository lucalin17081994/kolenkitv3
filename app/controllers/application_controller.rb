class ApplicationController < ActionController::Base

  

  
  def require_admin
    unless current_user && current_user.admin?
      flash[:notice] = "You are not an admin"
      redirect_to root_path
    end        
  end
end
