Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts, only: [:show, :index, :create, :destroy] do
    resources :comments, only: [:create]
  end
  resources :tasks

  root to: "home#index"
end
