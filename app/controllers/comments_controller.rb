class CommentsController < ApplicationController
  def api_index
    comments = Comment.all

    if params[:param].present?
      comments_table = Comment.arel_table

      comments = comments.where(
        comments_table[:commenter].matches("%#{params[:param]}%")
          .or(
            comments_table[:body].matches("%#{params[:param]}%")
          )
      )
    end

    render json: comments.select(:commenter, :body)
    # render json: Comment.select(:commenter, :body)
  end

  def api_index_not_empty
    comments = Comment.where.not(commenter: ["", nil])
                      .where.not(body: ["", nil])

    if params[:param].present?
      comments = comments.where(
        "commenter LIKE :q OR body LIKE :q",
        q: "%#{params[:param]}%"
      )
    end

    render json: comments.select(:commenter, :body)
  end

  def api_index_without_body
    render json: Comment.where(body: [ "", nil ])
                        .select(:commenter, :body)
  end

  def api_index_without_commenter
    comments = Comment.where(commenter: [ "", nil ])

    render json: comments.as_json(
      only: [:commenter, :body],
      methods: [:ydob]
    )
  end

  def api_index_incomplete
    render json: Comment.where(commenter: [ "", nil ])
                        .or(Comment.where(body: [ "", nil ]))
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
