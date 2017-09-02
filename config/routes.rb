Rails.application.routes.draw do
  # get 'users/edit' => 'users#edit'

  devise_for :users
  resources :users
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end

  root 'post_images#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
