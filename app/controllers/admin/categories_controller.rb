class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
    @categories = Category.all
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to new_admin_category_path
    else
      @categories = Category.all
      redirect_to new_admin_category_path
    end
  end

  def index
  end

  def edit
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
  
end
