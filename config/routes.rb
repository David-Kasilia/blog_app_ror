Rails.application.routes.draw do
resources :likes
 resources :comments
 resources :users, only: %i[index show] do
  resources :posts, only: %i[index show new]
 end

 root to: 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
