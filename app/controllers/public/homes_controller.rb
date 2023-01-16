class Public::HomesController < ApplicationController
  def top
    @articles = Article.published.order(created_at: :desc).page(params[:page]).per(10)
    @admin = Admin.find(1)
  end
  
  def about
  end
end
