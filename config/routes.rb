Rails.application.routes.draw do
  get '/users/profile', to: 'users#profile', as: 'user_profile'
  patch '/users/:id/avatar', to: 'users#update_avatar', as: 'user_avatar'
  get '/profile', to: 'users#profile', as: 'profile'
  get 'comments/create'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts, only: [:show, :index, :create, :destroy] do
    member do
      get "like", to: "posts#like"
      delete "unlike", to: "posts#unlike"
    end
    resources :comments, only: [:create]
  end
  resources :tasks, except: [:show]

  root to: "home#index"
end
