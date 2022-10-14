class Public::HomesController < ApplicationController
  def top
    @articles = Article.published.order(created_at: :desc)
  end
  
  def about
  end
end
