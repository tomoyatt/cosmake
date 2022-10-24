class Admin::FavoritesController < ApplicationController
  def index
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:article_id)
    @favorite_articles = Article.find(favorites).page(params[:page]).per(30)
    @admin = Admin.find(1)
  end
end
