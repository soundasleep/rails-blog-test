class PostsController < ApplicationController

	# GET /posts/new
	# a 'plain view'
	def new
		# we have to create an empty one here for the new partial form to work
		@post = Post.new
	end

	# POST /posts/create
	# if no render is specified, will return 'Template is missing'
	def create
		# can only call render once in an action
		# render text: params[:post].inspect
		# this is a render({text: ...})
		# render text: params[:post].inspect
		# other options: 'text', 'xml', 'json' (appropriate Content-Type headers are also sent)
		# render json: params[:post]
		# render xml: {name: "david"}.to_xml

		# @instance_variable
		# @post = Post.new(params[:post]) - equivalent to Post.new(params['post'])
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			# validation failed
			# renders the 'new' template with the current parameters
			render 'new'
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private

		# because lol we shouldn't accept all POSTed variables directly into a db
		def post_params
			# equivalent
			# params.require(:post).permit(:title, :text, :allow_comments)
			params.require('post').permit('title', 'text', 'allow_comments')
		end

end
