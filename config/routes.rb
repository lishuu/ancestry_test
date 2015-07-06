Rails.application.routes.draw do
  

  # get 'customer/index'
  # get 'customer', to: 'customer/index'
  resources :customer
  resources :category

  root 'category#index'

  get 'tree_full', to: 'category#tree_full'
  # get 'datatable_ajax', to: 'customer#datatable_ajax'
  # get 'communities', to: 'communities#index'
  get 'communities/index'
  get 'distrcits', to:'communities#load'
  
end
