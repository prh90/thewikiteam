Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new,:create]
  resource :sessions, only:[:create,:destroy]
  get 'login', to: 'sessions#new'

  resources :articles, only: [:new, :create]

  root "welcome#index"

end

