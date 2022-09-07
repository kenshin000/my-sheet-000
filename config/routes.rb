Rails.application.routes.draw do
  devise_for :users
  root to: 'languages#index'
  resources :languages, only: [:index, :new, :create, :show] do 
    resources :posts
  end
  resources :users, only: :show
end
