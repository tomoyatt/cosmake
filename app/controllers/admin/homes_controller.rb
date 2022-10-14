class Admin::HomesController < ApplicationController
  def top
    @articles = Article.published.order(created_at: :desc)
  end
end
