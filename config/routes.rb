Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#index"
  resources :books
  resources :users
  resources :homes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
