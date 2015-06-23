Rails.application.routes.draw do
  # get 'customer/index'
  # get 'customer', to: 'customer/index'
  resources :customer

  root 'category#index'

  get 'tree', to: 'category#tree_data'
  # get 'datatable_ajax', to: 'customer#datatable_ajax'
end
