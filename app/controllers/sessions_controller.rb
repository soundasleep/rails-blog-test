class SessionsController < ApplicationController

	# to prevent ActionController::InvalidAuthenticityToken, i guess because
	# the OpenID controller doesn't pass it along or something
	# see http://archive.railsforum.com/viewtopic.php?id=27812
	skip_before_filter :verify_authenticity_token, :only => :create

	def new
		# render a login form
	end

	def create
		# process login
		authenticate_with_open_id do |result, openid_identity|
			if result.successful?
				# TODO normalizing url
				unless user = User.find_by_openid_identity(openid_identity)
					user = User.create(openid_identity: openid_identity)
					user.remember_token = Random.rand(999999);			# need to create a remember token for this user now (maybe we can reset it later)
					user.save()
				end
				# in case there is no remember token set
				if !user.remember_token? then
					user.remember_token = Random.rand(999999);
					user.save()
				end
				sign_in user
			else
				@result = result		# for rendering a failure message
				render 'new'
			end
		end
	end

	def destroy
		# logout
		logout
		redirect_to root_url
	end

end
