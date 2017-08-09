class PostImage < ApplicationRecord
	attachment :image
	belongs_to :user
end
