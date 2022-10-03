class Admin::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path(@article.id)
    else
      @article = Article.new(article_params)
      flash[:notice] = "項目は必ず入力してください"
      render :new
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Aeticle.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article.id)
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end

  private

  def article_params
    values = params.require(:article).permit(
      :title, :image, :content, :is_active,
      category_ids: []
      )
    if values[:category_ids].nil?
      values[:category_ids] = []
    end
    return values
  end

end
