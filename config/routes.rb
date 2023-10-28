Rails.application.routes.draw do
  get '/users/profile', to: 'users#profile', as: 'user_profile'
  patch '/users/:id/avatar', to: 'users#update_avatar', as: 'user_avatar'
  get '/profile', to: 'users#profile', as: 'profile'
  get 'comments/create'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts, only: [:show, :index, :create, :destroy] do
    resources :comments, only: [:create]
  end
  resources :tasks

  root to: "home#index"
end
