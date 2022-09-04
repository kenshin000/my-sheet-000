Rails.application.routes.draw do
  devise_for :users
  root to: 'languages#index'
  resources :languages, only: [:index, :new, :create, :show] do 
    resources :posts, only: [:index, :new, :create, :show]
  end
  resources :users, only: :show
end
