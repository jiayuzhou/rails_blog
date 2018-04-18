# controller for comments.
class CommentsController < ApplicationController

  http_basic_authenticate_with name: 'admin', password: 'changeme', except: [:index, :show]
  
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

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    # The destroy action will find the article we are looking at, locate the
    # comment within the @article.comments collection, and then remove it from
    # the database and send us back to the show action for the article.

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
