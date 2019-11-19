class PostImage < ApplicationRecord
  # --------------------------------------
  # Relations
  # --------------------------------------
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  # --------------------------------------
  # Validations
  # --------------------------------------
  validates :shop_name, presence: true
  validates :image, presence: true

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
