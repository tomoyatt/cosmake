class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(50)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.published.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show_admin
    @admin = Admin.find(1)
    @articles = Article.where(user_id: 0).order(created_at: :desc).page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      redirect_to edit_admin_user_paht(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
