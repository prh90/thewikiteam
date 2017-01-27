Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show]
  resources :users, only: [:new,:create]
  resources :articles, only: [:new, :create, :show] do

  	resources :revisions, only: [:index]
  	resources :sections, :shallow => true 

  end

  resource :sessions, only:[:create,:destroy]
  get 'login', to: 'sessions#new'
  
  get 'logout', to: 'sessions#destroy'


  root "welcome#index"

end
