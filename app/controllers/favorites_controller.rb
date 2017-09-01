class FavoritesController < ApplicationController

	def create
		post_image = PostImage.find(params[:post_image_id])
        favorite = current_user.favorites.new(post_image_id: post_image.id)
        favorite.save
        # puts request.referer
        if request.referer == "http://0.0.0.0:3000/post_images/#{post_image.id}"
        	redirect_to post_image_path(post_image.id)
        else
        	redirect_to post_images_path
        end
        
	end

	def destroy
		favorite = current_user.favorites.find_by(post_image_id: params[:post_image_id])
        favorite.destroy
        if request.referer == "http://0.0.0.0:3000/post_images/#{params[:post_image_id]}"
        	redirect_to post_image_path(params[:post_image_id])
        else
        	redirect_to post_images_path
        end
	end
	
end
