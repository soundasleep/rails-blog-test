module SessionsHelper

	# mark someone as signed in
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
		redirect_to posts_url		# or root_url etc
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def logged_in?
		!current_user.nil?
	end

	def logout
		self.current_user = nil
		cookies.delete(:remember_token)
	end

end
