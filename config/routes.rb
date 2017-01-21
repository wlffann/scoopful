Rails.application.routes.draw do

  root to: 'splash#index'

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index]

      get '/most_popular', to: 'items#most_popular'
    end
  end

  get '/items', to: 'items#index', as: 'items'
  get 'items/:id', to: 'items#show', as: 'item'
  post '/retired_item', to: 'items#reject', as: 'retired_item'

  get '/orders', to: 'orders#index', as: 'orders'
  get '/orders/:id', to: 'orders#show', as: 'order'
  post '/orders', to: 'orders#create'
  put '/orders/:id', to: 'orders#update'

  post '/carts', to: 'carts#create'
  put    '/carts', to: 'carts#update'
  delete '/carts', to: 'carts#destroy'
  get    '/cart', to: 'carts#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update', as: 'user'
  
  get '/dashboard', to: 'users#show'
  
  get '/admin/dashboard', to: 'admin/base#dashboard'
  get '/admin/items', to: 'admin/items#index', as: 'admin_items'
  patch 'admin/items/:id', to: 'admin/items#update', as: 'admin_item'
  get '/admin/items/:id/edit', to: 'admin/items#edit', as: 'edit_admin_item'

  get '/:category_name', to: 'categories#show', as: 'category'
end