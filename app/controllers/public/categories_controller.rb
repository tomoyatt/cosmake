class Public::CategoriesController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @categories = Category.all
    @articles = Article.where(category_id: @category.id)
  end
end
