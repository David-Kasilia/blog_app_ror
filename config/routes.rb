Rails.application.routes.draw do
 resources :users, only: %i[index show] do
  resources :posts, only: %i[index show]
 end

 root to: 'users#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
