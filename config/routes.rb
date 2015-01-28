Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }
  resources :users, only: [:update]

  resources :lists, except: [:index] do
    resources :items, only: [:create]
  end 

  authenticated :user do
    root 'dashboards#show', as: :authenticated_root
  end

  root "welcome#index"
 
end
