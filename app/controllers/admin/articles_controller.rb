class Admin::ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = 0
    if @article.save
      redirect_to admin_article_path(@article.id)
    else
      @article = Article.new(article_params)
      flash[:notice] = "タイトルと本文は必ず入力してください"
      render :new
    end
  end

  def index
    @search = Article.ransack(params[:q])
    @articles = @search.result(distinct: true).published.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @admin = Admin.find(1)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.user_id = 0
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
