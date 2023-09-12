Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "posts#index"

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    member do
      post :repost
    end
  end
  resources :profiles, only: [:show]

  post "like", to: "likes#toggle"
end
