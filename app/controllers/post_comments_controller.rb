class PostCommentsController < ApplicationController
	def create
		post_image = PostComment.find(params[:post_comment_id])
        favorite = current_user.favorites.new(postimage_id: post_image.id)
        # favorite = Favorite.new
        # favorite.user_id = current_user.id
        # favorite.post_image_id = postimage.id
        favorite.save
        redirect_to postimages_path
	end

	def destroy
		favorite = current_user.favorites.find_by(postimage_id: params[:postimage_id])
        favorite.destroy
        redirect_to postimages_path
	end
end
