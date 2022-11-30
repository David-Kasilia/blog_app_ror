Rails.application.routes.draw do
  get 'likes/index'
  get 'comments/new'
 resources :users, only: %i[index show] do
  resources :posts, only: %i[index show]
 end

 root to: 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
