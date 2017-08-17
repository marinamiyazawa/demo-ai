class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :post_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
