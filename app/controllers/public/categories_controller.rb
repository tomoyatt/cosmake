class Public::CategoriesController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @category_id = @category.id
    @articles = Category.find(@category_id).articles.published.order(created_at: :desc).page(params[:page]).per(20)
  end

end
