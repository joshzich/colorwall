class User < ActiveRecord::Base
	has_many :articles 
	has_many :comments

	def password=(pass_input)
		self.hashed_password = BCrypt::Password.create(pass_input)
	end

	def password
		@password = BCrypt::Password.new(self.hashed_password)
	end

	def authenticate(email_input, pass_input)
		user = User.find_by_email(email_input)
		return user if user && user.password == pass_input
		nil 
	end
end
