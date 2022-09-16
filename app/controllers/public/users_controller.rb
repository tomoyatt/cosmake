class Public::UsersController < ApplicationController

  before_action :authenticate_user

  def show
    @user = current_user
    @articles = @user.articles
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path
    else
      flash[:user_edit_error] = "項目は必ずご入力ください"
      redirect_to customers_edit_path
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
