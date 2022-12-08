Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  
  resources :users, only: %i[index show destroy] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy] 
      resources :likes, only: %i[new create destroy]
    end
  end
  
  namespace :api do
    namespace :v1 do
      resources :users do
      resources :posts do
        resources :comments
      end
    end
  end
end

# Defines the root path route ("/")
# root "articles#index"
# namespace :api do
#   namespace :v1 do
#     get 'comments/index'
#     get 'comments/show'
#     get 'post/index'
#     get 'post/show'
#     get 'user/index'
#     get 'user/show'
#   end
# end

end
