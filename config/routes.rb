 Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
  # get 'post_image/new'
  # get 'post_image/index'
  # get 'post_image/show'
  # get 'post_image/edit'
  
  get "/homes/about" => "homes#about", as: "about"
  # Usersコントローラのrouting
  resources :users, only: [:show, :edit, :update]
end