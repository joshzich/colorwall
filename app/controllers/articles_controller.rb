class ArticlesController < ApplicationController
	http_basic_authenticate_with name: 'dhh', password: 'secret', 
except: [:index, :show]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		user = User.find(session[:id])
		@article = Article.new(article_params)

		if	@article.save
			user.articles << @article 
			redirect_to @article 
		else
			render 'new'
		end
	end

	# def create
	#   article = Article.new
	#   article.created_by = current_user.id # `created_by` tracks which user authored the article
	#   article.attributes = params[:article]
	#   article.save

	#   redirect_to articles_url
	# end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path 
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
	#odd styling in the tutorial. Seems like you wouldn't want to indent
	#the private methods here. 
end
