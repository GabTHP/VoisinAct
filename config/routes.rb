Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  resources :users

  root 'projects#index'
  resources :projects


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end

