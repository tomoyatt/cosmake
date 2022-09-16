class Public::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to article_path(@article.id)
  end

  def index
    @articles = Article.published
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.user_id = current_user.id
    @article.update(article_params)
    redirect_to article_path(@article.id)
  end


  private

  def article_params
    params.require(:article).permit(:title, :image, :content, :user_id, :category_id, :is_active)
  end

end