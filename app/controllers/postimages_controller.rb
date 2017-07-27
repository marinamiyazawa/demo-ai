class PostimagesController < ApplicationController

	def index
		@postimages = PostImage.all
	end

	def new
		@postimage = PostImage.new
	end

	def create
		@postimage = PostImage.new(postimage_params)
	end


	private

	def postimage_params
		params.require(:postimage).permit(:shop_name,
										  :image_url,
										  :caption,
										  :user_id)
	end
end
