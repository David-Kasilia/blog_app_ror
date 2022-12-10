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
      post :auth, to: "authentication#login"
      resources :users do
        post :create, to: "users#create"
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
  # get 'api/index'
  # get 'api/show'
#     get 'comments/index'
#     get 'comments/show'
#     get 'post/index'
#     get 'post/show'
#     get 'user/index'
#     get 'user/show'
#   end
# end
# post "login" => "users#login"
# get "users" => "users#index"
# get "user/posts" => "posts#index"
# get "post/comments" => "comments#index"
# get "post/comments/create" => "comments#create"

end
