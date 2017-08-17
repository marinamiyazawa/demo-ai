class FavoritesController < ApplicationController
	def create
		post_image = PostImage.find(params[:post_image_id])
        favorite = current_user.favorites.new(post_image_id: post_image.id)
        # favorite = Favorite.new
        # favorite.user_id = current_user.id
        # favorite.post_image_id = post_image.id
        favorite.save
        redirect_to post_images_path
	end

	def destroy
		favorite = current_user.favorites.find_by(post_image_id: params[:post_image_id])
        favorite.destroy
        redirect_to post_images_path
	end
end
