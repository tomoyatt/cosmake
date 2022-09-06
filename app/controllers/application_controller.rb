class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  
  def authenticate_user
    @user = current_user
    if @user == nil
      redirect_to new_user_session_path
    end
  end
  
end
