class Public::CommentsController < ApplicationController
  
  before_action :ensure_current_user, only: [:destroy]

  def create
    article = Article.find(params[:article_id])
    comment = current_user.comments.new(comment_params)
    comment.article_id = article.id
    comment.save
    redirect_to article_path(article)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to article_path(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
