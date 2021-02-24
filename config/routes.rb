Rails.application.routes.draw do
  root to: 'memos#index'
  resources :memos, except: :new
end
