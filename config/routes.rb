Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users do
    resources :tickets, controller: 'users/tickets'
  end

  match 'search', to: 'searches#index', via: [:get, :post]

  namespace :admin do
    resources :railway_stations
    resources :trains do
      resources :carriages
    end
    resources :routes
    resources :tickets
  end

  get 'welcome/index'
  get 'admin_resources/index'


  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
