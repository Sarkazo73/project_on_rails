Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  resources :carriages
  resources :routes
  resources :users do
    resources :tickets, controller: 'users/tickets'
  end
  resources :tickets

  match 'search', to: 'searches#index', via: [:get, :post]
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
