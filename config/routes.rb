Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :posts, only: [:index]
    resources :comments, only: [:index]
  end

  resources :posts, only: [:index, :show, :create, :update, :destroy] do
    resources :comments, only: [:index]
  end

  resources :categories, only: [:index, :show, :create, :update, :destroy] do
    resources :posts, only: [:index]
  end

  resources :comments, only: [:index, :show, :create, :update, :destroy]
end
