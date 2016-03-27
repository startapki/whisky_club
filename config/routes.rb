Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }

  namespace :admin do
    resources :meetings
    resources :items
    resources :users

    root to: 'meetings#index'
  end

  resources :meetings do
    resources :items
  end

  resources :ratings, only: [:create, :update]

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'home#index'

  mount PostgresqlLoStreamer::Engine => '/images'
end
