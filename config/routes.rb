Rails.application.routes.draw do

  resources :code_troubleshootings

  resources :customers
  resources :categories
  resources :meter_statuses

  root 'customers#index'

  get 'tree_full', to: 'categories#tree_full'
  get 'communities/index'
  get 'distrcits', to:'categories#load'
  get 'cty/lists', to:  'code_troubleshootings#datatable_ajax'
  
end
