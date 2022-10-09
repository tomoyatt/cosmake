class Public::UsersController < ApplicationController

 before_action :authenticate_user, {only: [:mypage,:unsubscribe, :edit, :update]}
 before_action :ensure_current_user, {only: [:edit,:unsubscribe, :update, :destroy]}
 before_action :ensure_guest_user, {only: [:edit, :unsubscribe, :update, :destroy]}

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.published
  end

  def show_admin
    @admin = Admin.find(1)
    @articles = Article.where(user_id: 0)
  end

  def mypage
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
      redirect_to users_edit_path
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to root_path
  end

  def unsubscribe
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i
      redirect_to root_path
    end
  end

  def ensure_guest_user
    if current_user.email == "guest@cosmake.com"
      flash[:alert] = "ゲストユーザーの更新・削除はできません。"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
