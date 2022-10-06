class Public::CategoriesController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @categories = Category.all
    @articles = Article.where(category_id: @category.id)
  end
  
  def show
    @category = Category.find(params[:id])
    @category = Category.all
    @articles = Article.where(category_ids: @category.id)
  end
  
end
