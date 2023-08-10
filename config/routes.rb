Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index]
    resources :comments, only: [:index]
  end

  resources :posts, only: [:index, :show, :create, :update, :destroy] do
    resources :comments, only: [:index]
  end
  
  resources :comments, only: [:index, :show, :create, :update, :destroy]
end
