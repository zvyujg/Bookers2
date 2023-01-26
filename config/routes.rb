Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about',as:'about'
  devise_for :users
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :index, :show,:edit,:destroy,:create]
  resources :users, only: [:show, :edit, :index]
  
end
