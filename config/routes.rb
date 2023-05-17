Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :markets, only: [:index, :show] do
        resources :vendors, only: [:index], module: :market
      end

      resources :vendors, only: [:show]
    end
  end
end
