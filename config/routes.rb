Rails.application.routes.draw do
  get 'home/index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  get '/credentials' => 'credentials#index', as: 'user_credentials'
  get '/users/:user_id/assets/:id/change_password', to: 'assets#edit_password', as: 'edit_asset_password'
  post '/users/:user_id/assets/:id/update_password', to: 'assets#update_password', as: 'update_asset_password'
  get '/users/:user_id/assets/:id/assign', to: 'assets#assign', as: 'assign_user_asset'
  post '/users/:user_id/assets/:id/assign', to: 'assets#transfer', as: 'transfer_user_asset'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :assets
  end
  resources :assets do
    resources :comments
  end
  root 'home#index'
end
