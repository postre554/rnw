Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy, :new]
  end

  resources :comments
  get 'posts',                to:'posts#index',                as:'user_root'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
