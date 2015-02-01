Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }
  resources :users, only: [:update]
  resources :lists, except: [:index] do
    resources :items, only: [:create, :destroy] do
      resources :checkeds , only: [:create, :destroy]
      collection do 
        delete :destroy_all
      end
    end 
  end 
   
  root "welcome#index"
end
