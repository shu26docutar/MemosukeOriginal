Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root to: 'posts#index'
  resources :posts, except: :new do
    collection do
      get 'search'
    end
  end
  resources :events
  resources :users, only: :show
end
