class CommentsController < ApplicationController
  def api_index
    render json: Comment.select(:commenter, :body)
  end

  def api_index_not_empty
    render json: Comment.where.not(commenter: ["", nil])
                        .where.not(body: ["", nil])
                        .select(:commenter, :body)
  end
  
  def api_index_without_body
    render json: Comment.where(body: ["", nil])
                        .select(:commenter, :body)
  end

  def api_index_without_commenter
    render json: Comment.where(commenter: ["", nil])
                        .select(:commenter, :body)
  end

  def api_index_incomplete
    render json: Comment.where(commenter: ["", nil])
                        .or(Comment.where(body: ["", nil]))
                        .select(:commenter, :body)
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
