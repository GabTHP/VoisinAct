Rails.application.routes.draw do
  devise_for :users
  resources :users

  root 'projects#index'
  resources :projects

end

