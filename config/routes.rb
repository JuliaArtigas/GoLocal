Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 get '/locations/:id/approve', to: 'locations#approve', as: 'approve_location'
 get '/events/:id/approve', to: 'events#approve', as: 'approve_event'
 delete '/favorites/:id', to: 'favorites#destroy', as: 'delete_favorite'

  resources :locations do
    resources :favorites, only: [:create]
  end
  resources :events do
    resources :favorites, only: [:create]
  end

  resources :ratings
  resources :favorites, only: [:index]
  resources :cities
  resources :neighborhoods
  resources :profiles, only: [:show, :edit, :update]
  resources :search, only: :index
  # resources :locations
end
