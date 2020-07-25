Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#index"

  resources :users
  resources :homes
  resources :books do
    resources :favorites, only: [:create, :destroy]
  end
    resources :books, only: [:index, :show, :create] do
    resources :comments, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
