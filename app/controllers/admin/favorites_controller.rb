class Admin::FavoritesController < ApplicationController
  def index
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:article_id)
    @favorite_articles = Article.find(favorites)
  end
end
