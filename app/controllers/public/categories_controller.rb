class Public::CategoriesController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @category_id = @category.id
    @articles = Category.find(@category_id).articles.published
  end

end
