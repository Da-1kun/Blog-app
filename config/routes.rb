Rails.application.routes.draw do
  
  root 'pages#top'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'search', to: 'articles#search'

  resources :users
  resources :articles
  resources :categories, except: [:destroy]
end
