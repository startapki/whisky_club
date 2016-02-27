Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :meetings

    root to: "meetings#index"
  end

  resources :meetings

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: 'home#index'
end
