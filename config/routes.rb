Rails.application.routes.draw do
  get 'users/login' => 'users#login', as: :login
  post 'users/login' => 'users#check', as: :check
  delete 'logout' => 'users#logout', as: :logout
  resources :expenses
  resources :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
