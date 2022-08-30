Rails.application.routes.draw do
  devise_for :users
  root to: 'languages#index'
  resources :languages, only: :index
end
