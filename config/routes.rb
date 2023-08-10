Rails.application.routes.draw do

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:index, :show, :create, :destroy]
  end
end  
  
