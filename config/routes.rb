Rails.application.routes.draw do
  get 'sessions/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  post '/login', to: 'sessions#create'
  namespace :api do
    namespace :v1 do
      resources :food_trucks, except: [:new, :edit] do
        resources :open_dates, except: [:new, :edit]
      end
      resources :breweries, except: [:new, :edit] do
        resources :brewery_events, except: [:new, :edit]
      end
    end
  end
end
