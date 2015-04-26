class WelcomeController < ApplicationController
  def index
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save 
  		session[:id] = user.id
  		redirect_to "/users/#{@user.id}"
  	else
  		@errors = @user.errors.full_messages
  	end
  end
end
