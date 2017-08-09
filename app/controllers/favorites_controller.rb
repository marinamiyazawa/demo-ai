class FavoritesController < ApplicationController
	def create
		postimage = Post.find(params[:postimage_id])
        favorite = current_user.favorites.build(postimage: postimage)
        favorite.save
        redirect_to postimages_path
	end

	def destroy
		favorite = current_user.favorites.find_by(postimage_id: params[:postimage_id])
        favorite.destroy
        redirect_to postimages_path
	end
end
