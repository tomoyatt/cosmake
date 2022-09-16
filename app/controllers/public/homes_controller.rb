class Public::HomesController < ApplicationController
  def top
    @articles = Article.published
  end
end
