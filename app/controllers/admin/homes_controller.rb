class Admin::HomesController < ApplicationController
  def top
    @articles = Article.published
  end
end
