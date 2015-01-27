Rails.application.routes.draw do

 devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }
 resources :users, only: [:update]
 resources :lists, except: [:index] do
  resources :items, only: [:create]
 end 
 root "welcome#index"
 
end
