Rails.application.routes.draw do
  get 'like/show'
  get 'users/show'
  devise_for :users

  resources :users
  resources :cities
  resources :attendances, only: [:create, :destroy]
  resources :likes

  root 'projects#index'
  resources :projects

  scope ':by_city' do
    resources :city, only: [:index]

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end

