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
    @category = Category.find(params[:id])
    @category_id = @category.id
    @articles = Category.find(@category_id).articles.order(created_at: :desc).page(params[:page]).per(20)
     @admin = Admin.find(1)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to new_admin_category_path
    else
      flash[:category_edit_error] = "ジャンル名を入力してください"
      @category = Category.find(params[:id])
      redirect_to edit_admin_category_path(@category)
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
