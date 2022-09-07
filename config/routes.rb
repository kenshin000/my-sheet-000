Rails.application.routes.draw do
  devise_for :users
  root to: 'languages#index'
  resources :languages, only: [:index, :new, :create, :edit, :destroy, :update] do 
    resources :posts
  end
  resources :users, only: :show
end
