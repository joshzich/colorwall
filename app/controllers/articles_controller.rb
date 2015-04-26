class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if	@article.save
			redirect_to @article 
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
	#odd styling in the tutorial. Seems like you wouldn't want to indent
	#the private methods here. 
end
