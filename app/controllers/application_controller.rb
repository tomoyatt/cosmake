class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  
  def authenticate_user
    @user = current_user
    if @user == nil
      redirect_to new_user_session_path
    end
  end
  
end
