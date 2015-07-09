Rails.application.routes.draw do
  

  resources :customers
  resources :categories

  root 'customers#index'

  get 'tree_full', to: 'categories#tree_full'
  get 'communities/index'
  get 'distrcits', to:'categories#load'
  
end
