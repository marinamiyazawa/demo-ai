class Favorite < ApplicationRecord
  # --------------------------------------
  # Relations
  # --------------------------------------
  belongs_to :user
  belongs_to :post_image
end
