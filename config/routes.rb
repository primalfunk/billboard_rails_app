Rails.application.routes.draw do
  devise_for :users
  root 'charts#index'

  resources :charts do
    resources :songs
  end

  resources :artists do
    resources :songs
  end

  resources :accounts
end
