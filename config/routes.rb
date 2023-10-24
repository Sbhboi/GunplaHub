Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts, only: [:index, :create, :destroy] do
    resources :comments, only: [:create]
  end

  root to: "home#index"
end
