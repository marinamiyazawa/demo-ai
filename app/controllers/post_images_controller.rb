class PostImagesController < ApplicationController

	def index
		@postimages = PostImage.all
	end

	def new
		@postimage = PostImage.new
	end

	def create
		@postimage = PostImage.new(postimage_params)
		@postimage.user_id = current_user.id
		@postimage.save
		redirect_to post_images_path
	end

	def show
		@postimage = PostImage.find(params[:id])
	end


	private

	def postimage_params
		params.require(:post_image).permit(:shop_name,
										  :image,
										  :caption,
										  :user_id)
	end
end
