class SessionsController < ApplicationController
	def create
		if user = User.authenticate(params[:user][:email], params[:user][:password])
			session[:id] = user.id
			redirect_to "/users/#{user.id}"
		else
			@errors = user.errors.full_messages
			render "welcome/index"
		end		
	end

	def destroy
		session[:id] = nil 
		redirect_to "/"
	end	
end
