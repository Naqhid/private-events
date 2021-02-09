Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'events/upcoming', to: 'events#show_upcoming'
  get 'events/past', to: 'events#show_past'

  devise_for :users
  resources :users, only: %w[index show new,create]
  resources :events, only: %w[index show new create]

  resources :attendances

  resources :attendances do
    match '/join', to: 'attendances#join', via: :post, on: :collection
  end

  root 'events#index'
end
