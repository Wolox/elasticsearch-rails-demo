Rails.application.routes.draw do
  root to: 'application#index'

  mount Sidekiq::Web, at: 'sidekiq'

  resources :search, only: [] do
    collection do
      get :index
    end
  end
end
