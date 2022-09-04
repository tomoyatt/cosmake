class Public::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.create!(article_params)
    redirect_to article_path(@article.id)
  end

  def index
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
  end
  
  
  private
  
  def article_params
    params.require(:article).permit(:title, :body)
  end
  
end
