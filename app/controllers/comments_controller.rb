# controller for comments.
class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])

    # the create method on @article.comments to create and save the comment.
    # This will automatically link the comment so that it belongs to that
    # particular article.
    @comment = @article.comments.create(comment_params)

    # Once we have made the new comment, we send the user back to the original
    # article using the article_path(@article) helper.
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
