class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	# need to include the helper manually for a controller
	# this gives us access to all session helpers such as logged_in?
	include SessionsHelper

end
