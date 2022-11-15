class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  before_action :search
  before_action :authenticate_admin!, if: :admin_url

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
  
  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to root_path
    end
  end


  def search
    @search = Article.ransack(params[:q])
    @articles = @search.result(distinct: true).published
  end

  def admin_url
    request.fullpath.include?("/admin")
  end

end
