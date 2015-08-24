Rails.application.routes.draw do

  resources :code_troubleshootings
  resources :meter_changings

  resources :customers
  resources :categories
  resources :meter_statuses
  resources :maintenances

  root 'customers#index'

  get 'tree_full', to: 'categories#tree_full'
  get 'communities/index'
  get 'distrcits', to:'categories#load'
  get 'cty/lists', to:  'code_troubleshootings#datatable_ajax'
  get 'mlist', to: 'maintenances#datatable_ajax'
  get 'meterchanginglist', to: 'meter_changings#datatable_ajax'
  
end
