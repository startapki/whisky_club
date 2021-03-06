Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  namespace :admin do
    resources :meetings
    resources :kinds
    resources :attribute_kinds
    resources :possible_values
    resources :items
    resources :attribute_values
    resources :users
    resources :notifications

    get '/identities/:id', to: redirect('/admin/'), as: :identity

    root to: 'meetings#index'
  end

  resources :meetings, only: :index
  resources :items, only: :index

  resources :ratings, only: [:create, :update]

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'home#index'

  mount PostgresqlLoStreamer::Engine => '/images'
end
