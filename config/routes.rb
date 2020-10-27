Rails.application.routes.draw do
  
  devise_for :users
  resources :menu_items
  # get 'menu_items', to: 'menu_items#index'
  # get 'menu_items/new', to: 'menu_items#new'
  # get 'menu_items/:id', to:'menu_items#show' #show
  # post 'menu_items/', to: 'menu_items#create' #create
  # put 'menu_items/:id', to: 'menu_items#update' #update
  # get 'menu_items/edit/:id', to: 'menu_items#edit'
  # delete 'menu_items/:id', to: 'menu_items#destroy' #delete
   get '/order/:id', to: 'cafe#order', as: 'order'
  # get 'orders', to: 'orders#show'
  get 'admin/menu', to: 'admin#menu'
  root to: 'cafe#index'
  
end
