class PostimagesController < ApplicationController

	def index
		@postimages = PostImage.all
	end

	def new
		@postimage = PostImage.new
	end

end
