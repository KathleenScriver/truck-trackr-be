Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :food_trucks, except: [:new, :edit] do
        resources :open_dates, only: [:index, :create, :show]
      end
      resources :breweries, except: [:new, :edit] do
        resources :brewery_events, only: [:index, :create]
      end
    end
  end
end
