class PostimagesController < ApplicationController

	def index
		@postimages = PostImage.all
	end

	def new
		@postimage = PostImage.new
	end

	def create
		@postimage = PostImage.new(postimage_params)
		@postimage.save
		redirect_to postimages_path
	end


	private

	def postimage_params
		params.require(:post_image).permit(:shop_name,
										  :image,
										  :caption,
										  :user_id)
	end
end
