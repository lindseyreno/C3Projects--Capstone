Rails.application.routes.draw do
  root 'welcome#index'
  resources :users

  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  post '/sign_in', to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy', as: 'sign_out'

  get '/users/:id/edit_preferences', to: 'users#edit_preferences', as: 'edit_preferences'
  patch '/users/:id/update_preferences', to: 'users#update_preferences', as: 'update_preferences'

  resources :account_activations, only: [:edit]
end
