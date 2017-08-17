class PostCommentsController < ApplicationController
	def create
		post_image = PostImage.find(params[:post_image_id])
        comment = current_user.post_comments.new(post_comment_params, )#(post_image_id: post_image.id,
        										 #comment: params[:comment])
        comment.post_image_id = post_image.id
        # comment = PostComment.new
        # comment.user_id = current_user.id
        # comment.post_comment_id = post_comment.id
        comment.save
        redirect_to post_image_path(post_image)
	end

	# def destroy
	# 	comment = current_user.post_comments.find_by(post_image_id: params[:post_image_id])
 #        comment.destroy
 #        redirect_to post_image_path(post_image)
	# end

	private

	def post_comment_params
		params.require(:post_comment).permit(:user_id,
										  :post_image_id,
										  :comment)
	end
end
