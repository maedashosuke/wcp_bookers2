Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :create, :index]
  get 'home/about' => 'homes#about'
end
