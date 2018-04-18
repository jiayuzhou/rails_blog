class ArticlesController < ApplicationController

	# note the the routes are controlled by rail routes. 
	# check routes using: bin/rails routes

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		# Passing the article object to the method, 
		# will automagically create url for submitting the edited article form. 
		# This option tells Rails that we want this form to be submitted via the 
		# PATCH HTTP method which is the HTTP method you're expected to 
		# use to update resources according to the REST protocol.
	    @article = Article.find(params[:id])
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
 
  		if @article.save  # validation successful. 
  			redirect_to @article	
  			# there are lots of possible usages in redirect to. 
  			# e.g., 
  			#     redirect_to :controller => 'admins', :action => 'index'
  			# for full details see here: https://apidock.com/rails/ActionController/Base/redirect_to

  		else  # when validation fails. 
  			render 'new'   # NOTE: no need to specifcy controller if in the same controller

  			# NOTE: 
  			# The render method is used so that 
  			# the @article object is passed back to 
  			# the new template when it is rendered (save the instance with error).
  			# otherwise, when the view access @article, it would give nil. 
  		end
  		
  	end

  	def update
  		@article = Article.find(params[:id])

  		if @article.update(article_params)
  			redirect_to @article
  		else
  			render 'edit'
  		end
  	end

  	private 
  		def article_params 
  			params.require(:article).permit(:title, :text)
  		end
end
