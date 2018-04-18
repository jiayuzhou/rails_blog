class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
 
  		if @article.save  # validation successful. 
  			redirect_to @article	
  		else  # when validation fails. 
  			render 'new'   # NOTE: no need to specifcy controller if in the same controller

  			# NOTE: 
  			# The render method is used so that 
  			# the @article object is passed back to 
  			# the new template when it is rendered (save the instance with error).
  			# otherwise, when the view access @article, it would give nil. 
  		end
  		
  	end

  	private 
  		def article_params 
  			params.require(:article).permit(:title, :text)
  		end
end
