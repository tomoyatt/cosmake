class Admin::HomesController < ApplicationController
  def top
    @articles = Article.published.order(created_at: :desc).page(params[:page]).per(20)
  end
end
