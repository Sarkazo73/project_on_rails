Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  resources :carriages
  resources :routes
  resources :users do
    resources :tickets
  end


  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
