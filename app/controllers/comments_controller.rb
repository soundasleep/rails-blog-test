class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		if !@post.allow_comments then
			redirect_to post_path(@post)
		end
		@comment = @post.comments.create(post_params)
		redirect_to post_path(@post)
	end

	private

		def post_params
			params.require(:comment).permit(:author, :text)
		end

end
