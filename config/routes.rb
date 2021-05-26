Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :tickets

  match 'search', to: 'searches#index', via: [:get, :post]

  namespace :admin do
    root 'resources#index'

    resources :railway_stations
    resources :trains do
      resources :carriages
    end
    resources :routes
    resources :tickets
    resources :users

  end

  get 'welcome/index'


  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
