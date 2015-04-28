class UsersController < ApplicationController
	def index
		@users = User.all
	end


	def create
		@user = User.new(user_params)
		if @user.save
			session[:id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			@errors = @user.errors.full_messages
			render 'welcome/index'
		end
	end

	def show
	 @user = User.find(params[:id])
	end

	private

		def user_params
			params.require(:user).permit(:username, :password, :email)
		end
end

